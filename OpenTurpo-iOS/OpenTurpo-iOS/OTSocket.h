//
//  OTSocket.h
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTSocket : NSObject
{
    NSString *_address;
    NSNumber *_portNumber;
    
}

@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSNumber *portNumber;

- (id) initWithAddress:(NSString*)address withPortNumber:(UInt16)portNumber;

- (void) dealloc;

- (void) open;
- (void) close;
- (void) listen;

- (void) sendMessage:(NSString*)message;

@end
