//
//  ArduinoConnection.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArduinoConnection.h"

// private
@interface ArduinoConnection ()
{
    NSString *_address;
    UInt16 _port;
}

/**
 * Connects to given address and port using IPv4
 * @address - the address to connect to
 * @port - the port to be used for connection
 **/
- (void) connectToAddress: (NSString*) address withPort: (UInt16) port;

@end

@implementation ArduinoConnection

- (id)initAndSetupConnectionWithAddress:(NSString*) address withPort: (UInt16) port
{
    // init self
    if (self = [super init]) {
        // keep address and copy the port number
        _address = address;
        [_address retain];
        _port = port;
        
        // try to connect
        [self connectToAddress:_address withPort:_port];
    }
    
    return self;
}

- (void) dealloc
{
    [_address release];
    [super dealloc];
}


- (void) streamMessage: (char*)message withSize:(int) size
{
    
}


#pragma mark - privat functions
- (void) connectToAddress: (NSString*) address withPort: (UInt16) port
{
    
}

@end
