//
//  OTMath.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OTMath.h"

#define DIVISION_BY_180 (1.0f / 180.0f)

@implementation OTMath

+ (CGFloat)degreeToRadian:(CGFloat) degree;
{
    return degree * (M_PI * DIVISION_BY_180);
}

+ (CGFloat)lerpFirstValue:(CGFloat)a withSecondValue:(CGFloat)b useTime:(CGFloat)time
{
    return ((1-time)*a) + (time*b);
}
@end
