//
//  ArduinoConnection.h
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArduinoConnection : NSObject
{
}


- (id)initAndSetupConnectionWithAddress:(NSString*) address withPort: (UInt16) port;


/**
 * Streams a message on the open channel (if any)
 * @message - the message to be sent
 * @size - the size of the message
 **/
- (void) streamMessage: (char*)message withSize:(int) size;



@end
