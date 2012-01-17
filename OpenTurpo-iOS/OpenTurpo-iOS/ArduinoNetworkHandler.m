//
//  ArduinoNetworkHandler.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArduinoNetworkHandler.h"

#import "ArduinoConnection.h"
#import "ArduinoNetworkModel.h"

/**
 * The NetworkHandler for sending messages to the arduino unit.
 * Uses an ArduinoConnection for handling udp socket connections.
 **/

@implementation ArduinoNetworkHandler

@synthesize arduinoConnection = _arduinoConnection;

- (id) init
{
    if (self = [super init]) {
        // Do init stuff here
    }
    
    return self;
}

- (id) initWithConnection:(ArduinoConnection*) connection
{
    if (self = [super init]) {
        // Do init stuff here
        self.arduinoConnection = connection;
    }
    
    return self;
}


- (void) dealloc
{
    [self.arduinoConnection release];
    [super dealloc];
}


@end
