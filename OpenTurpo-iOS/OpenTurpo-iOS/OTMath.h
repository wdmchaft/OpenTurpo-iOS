//
//  OTMath.h
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTMath : NSObject

+ (CGFloat)degreeToRadian:(CGFloat) degree;
    
+ (CGFloat)lerpFirstValue:(CGFloat)a withSecondValue:(CGFloat)b useTime:(CGFloat)time;

@end
