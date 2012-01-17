//
//  ArduinoNetworkHandler.h
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ArduinoConnection.h"

@interface ArduinoNetworkHandler : NSObject
{
    ArduinoConnection *_arduinoConnection;
}

@property (retain) ArduinoConnection *arduinoConnection;

/**
 * Initializes network handler with an existing connection
 * @connection - the existing connection to be used
 **/
- (id) initWithConnection:(ArduinoConnection*) connection;


@end
