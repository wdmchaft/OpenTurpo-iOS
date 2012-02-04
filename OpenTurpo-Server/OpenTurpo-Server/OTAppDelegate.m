//
//  OTAppDelegate.m
//  OpenTurpo-Server
//
//  Created by Tim Uusitalo on 1/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OTAppDelegate.h"
#import "OTSocket.h"

@interface OTAppDelegate ()
{
    OTSocket *_socket;
}

@end

@implementation OTAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    if (_socket != nil) {
        [_socket release];
    }
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    OTSocket *socket = [[OTSocket alloc] initWithAddress:@"127.0.0.1" withPortNumber:2001];
    
    [socket openAndListen:NO];
    
    _socket = socket;
}

@end
