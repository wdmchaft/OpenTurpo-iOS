//
//  example.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "example.h"

#include <CoreFoundation/CoreFoundation.h>
#include <sys/socket.h>
#include <netinet/in.h>



/*
 
 static void ReadStreamClientCallBack( CFReadStreamRef stream, CFStreamEventType type, void *clientCallBackInfo ) {
 switch (type)
 {
 case kCFStreamEventEndEncountered:
 {
 CFReadStreamClose(stream);
 break;
 }
 case kCFStreamEventErrorOccurred:
 break;
 case kCFStreamEventHasBytesAvailable:
 {
 UInt8 buffer[1024];
 CFReadStreamRead(stream, buffer, 1024);
 break;
 }
 case kCFStreamEventNone:
 break;
 case kCFStreamEventOpenCompleted:
 break;
 }
 }
 
 static void WriteStreamClientCallBack( CFWriteStreamRef stream, CFStreamEventType type, void *clientCallBackInfo ) {
 switch (type)
 {
 case kCFStreamEventEndEncountered:
 {
 CFWriteStreamClose(stream);
 break;
 }
 case kCFStreamEventErrorOccurred:
 break;
 case kCFStreamEventCanAcceptBytes:
 {
 NSString *reqStr = [NSString stringWithFormat: @"ConReq"];
 const UInt8 *rawstring = (const UInt8 *)[reqStr UTF8String];
 CFWriteStreamWrite(stream, rawstring, strlen((char *)rawstring));
 }
 case kCFStreamEventNone:
 break;
 case kCFStreamEventOpenCompleted:
 break;
 }
 }
 
 - (IBAction)loginLogoutButtonPressed:(id)sender {
 [spinner startAnimating];
 if (isLoggedIn) {
 [loginLogoutButton setTitle:@"Login"];
 }
 else {
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 NSString *iHostname = [defaults stringForKey:@"server"];
 NSString *iPort = [defaults stringForKey:@"port"];
 
 CFReadStreamRef readStream;
 CFWriteStreamRef writeStream;
 static const CFOptionFlags kReadNetworkEvents = kCFStreamEventEndEncountered |
 kCFStreamEventErrorOccurred |
 kCFStreamEventHasBytesAvailable |
 kCFStreamEventOpenCompleted |
 kCFStreamEventNone;
 static const CFOptionFlags kWriteNetworkEvents = kCFStreamEventEndEncountered |
 kCFStreamEventErrorOccurred |
 kCFStreamEventCanAcceptBytes |
 kCFStreamEventOpenCompleted |
 kCFStreamEventNone;
 CFStreamClientContext ctxt = {0,(void*)NULL,NULL,NULL,NULL};
 CFHostRef hostRef = CFHostCreateWithName(kCFAllocatorDefault,(CFStringRef)iHostname);
 
 CFStreamCreatePairWithSocketToCFHost(kCFAllocatorDefault, hostRef, [iPort intValue],
 &readStream, &writeStream);
 //CFSocketStreamPairSetSecurityProtocol(readStream, writeStream, kCFStreamSocketSecurityNone);
 
 CFReadStreamSetClient(readStream, kReadNetworkEvents, ReadStreamClientCallBack, &ctxt);
 CFWriteStreamSetClient(writeStream, kWriteNetworkEvents, WriteStreamClientCallBack, &ctxt);
 CFReadStreamScheduleWithRunLoop(readStream, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
 CFWriteStreamScheduleWithRunLoop(writeStream, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
 CFReadStreamOpen(readStream);
 CFWriteStreamOpen(writeStream);
 
 [loginLogoutButton setTitle:@"Logout"];
 }
 isLoggedIn = !isLoggedIn;
 [spinner stopAnimating];
 }

 */

@implementation example

static void AcceptCallBack(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info);


int sauce(){
    /* The server socket */
    CFSocketRef TCPServer;
#define PORT 2048
    /* The punchline to our joke */
    char punchline[] = "To get to the other side!";
    /* Used by setsockopt */
    int yes = 1;
    /* Build our socket context; this ties the punchline to the socket */
    CFSocketContext CTX = {0, punchline, NULL, NULL, NULL};
    
    /* Create the server socket as a TCP IPv4 socket and set a callback */
    /* for calls to the socket's lower-level accept() function */
    TCPServer = CFSocketCreate(kCFAllocatorDefault, PF_INET, SOCK_STREAM, IPPROTO_TCP, kCFSocketAcceptCallBack, (CFSocketCallBack)&AcceptCallBack, &CTX);
    
    if (TCPServer == NULL)
        return NULL;
    /* Re-use local addresses, if they're still in TIME_WAIT */
    setsockopt(CFSocketGetNative(TCPServer), SOL_SOCKET, SO_REUSEADDR,
               (void *)&yes, sizeof(yes));
    /* Set the port and address we want to listen on */
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_len = sizeof(addr);
    addr.sin_family = AF_INET;
    addr.sin_port = htons(PORT);
    addr.sin_addr.s_addr = htonl(INADDR_ANY);
    NSData *address = [NSData dataWithBytes: &addr length:sizeof(addr) ];
    if (CFSocketSetAddress(TCPServer, (CFDataRef)address) != kCFSocketSuccess) {
        fprintf(stderr, "CFSocketSetAddress() failed\n");
        CFRelease(TCPServer);
        return 0;
    }
    CFRunLoopSourceRef sourceRef =
    CFSocketCreateRunLoopSource(kCFAllocatorDefault, TCPServer, 0);
    CFRunLoopAddSource(CFRunLoopGetCurrent(), sourceRef, kCFRunLoopCommonModes);
    CFRelease(sourceRef);
    /* Get on with our life, instead of waiting for incoming connections. */
}

static void AcceptCallBack(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info) {
    CFReadStreamRef readStream = NULL;
    CFWriteStreamRef writeStream = NULL;
    CFIndex bytes;
    UInt8 buffer[128];
    UInt8 recv_len = 0, send_len = 0;
    /* The native socket, used for various operations */
    CFSocketNativeHandle sock = *(CFSocketNativeHandle *) data;
    /* The punch line we stored in the socket context */
    char *punchline = info;
    /* Create the read and write streams for the socket */
    CFStreamCreatePairWithSocket(kCFAllocatorDefault, sock,
                                 &readStream, &writeStream);
    if (!readStream || !writeStream) {
        close(sock);
        fprintf(stderr, "CFStreamCreatePairWithSocket() failed\n");
        return; }
    /* Wait for the client to finish sending the joke; wait for newline */
    memset(buffer, 0, sizeof(buffer));
    while (!strchr(buffer, '\n') && recv_len < sizeof(buffer)) {
        bytes = CFReadStreamRead(readStream, buffer + recv_len,
                                 sizeof(buffer)-recv_len);
        if (bytes < 0) {
            fprintf(stderr, "CFReadStreamRead() failed\n");
            close(sock);
            return;
        }
        recv_len += bytes;
    }
    /* Send the punchline */
    while (send_len < (strlen(punchline+1))) {
        if (CFWriteStreamCanAcceptBytes(writeStream)) {
            bytes = CFWriteStreamWrite(writeStream,
                                       punchline + send_len,
                                       (strlen(punchline)+1) - send_len);
            if (bytes < 0) {
                fprintf(stderr, "CFWriteStreamWrite() failed\n");
                close(sock);
                return;
            }
            send_len += bytes;
        }
        close(sock);
        return; 
    }
}

@end
