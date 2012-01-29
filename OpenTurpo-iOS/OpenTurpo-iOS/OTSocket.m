//
//  OTSocket.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OTSocket.h"

#import <CoreFoundation/CoreFoundation.h>
#import <sys/socket.h>
#import <netinet/in.h>

// private
@interface OTSocket ()
{
    CFSocketRef udpSocket;
    CFSocketContext udpSocketContext;
}

- (void) udpSocketCallback;

@end

@implementation OTSocket

#import <CoreFoundation/CoreFoundation.h>
#import <sys/socket.h>
#import <netinet/in.h>

@synthesize address = _address;
@synthesize portNumber = _portNumber;

- (id) initWithAddress:(NSString *)address withPortNumber:(UInt16)portNumber
{
    if (self = [super init]) {
        self.address = address;
        self.portNumber = [NSNumber numberWithInt:portNumber];
    }
    return self;
}

- (void) dealloc
{
    [_address release];
    [super dealloc];
}

- (void) open
{
    NSLog(@"Open socket not yet implemented.");
    
    // define socket context
    memset(&udpSocketContext, 0, sizeof(udpSocketContext));
    udpSocketContext.version = 0;
    udpSocketContext.info = "OpenTurpo UDP socket context";
    
    // create udp socket
    udpSocket = CFSocketCreate(kCFAllocatorDefault, PF_INET, SOCK_STREAM, IPPROTO_UDP, kCFSocketAcceptCallBack, (CFSocketCallBack)&self.udpSocketCallback, &udpSocketContext);
    
    if (udpSocket == NULL) {
        NSLog(@"Failed creating socket");
        return;
    }
}

- (void) close
{
    NSLog(@"Close socket not yet implemented");
}

- (void) listen
{
    // Re-use local address we want to listen on
    int yes = 1;
    setsockopt(CFSocketGetNative(udpSocket), SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes));
    
    struct sockaddr_in address;
    memset(&address, 0, sizeof(address));
    address.sin_len = sizeof(address);
    address.sin_family = AF_INET;
    address.sin_port = [_portNumber intValue];
    address.sin_addr.s_addr = htonl(INADDR_ANY);
    

}

- (void) sendMessage:(NSString*)message
{
    NSLog(@"Sending message not yet implemented. Logging the message: %@", message);
}


#pragma mark - socket callback(s)

- (void) udpSocketCallback
{
    NSLog(@"Socket callback called upon");
}

@end