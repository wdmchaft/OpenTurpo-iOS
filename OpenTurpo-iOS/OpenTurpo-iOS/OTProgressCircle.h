//
//  OTProgressCircle.h
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    OTProgressCircleTypePercent = 1, 
    OTProgressCircleTypeTachoMeter = 2,
    OTProgressCircleTypeSpeedoMeter = 4,
    OTProgressCircleTypeTurboMeter = 8
} OTProgressCircleType;

@interface OTProgressCircle : UIView
{
    CGFloat _lineWidth;
    CGFloat _progress;
    UIColor *_strokeColor;
    UIColor *_warningColor;
    UILabel *_valueLabel;
    OTProgressCircleType _type;
}

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat startAngle;
@property (nonatomic, assign) CGFloat endAngle;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, retain) UIColor *strokeColor;
@property (nonatomic, retain) UIColor *warningColor;
@property (nonatomic, retain) UILabel *valueLabel;
@property (nonatomic, assign) OTProgressCircleType type;

- (void)drawRect:(CGRect)rect;

@end
