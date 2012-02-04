//
//  OTProgressCircle.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OTProgressCircle.h"

@interface OTProgressCircle () 
{
    CGFloat _clockwise;
}
- (CGFloat)degreeToRadian:(CGFloat) degree;
- (CGFloat)lerpFirstValue:(CGFloat)a withSecondValue:(CGFloat)b useTime:(CGFloat)time;

@end
@implementation OTProgressCircle

@synthesize lineWidth = _lineWidth;
@synthesize progress = _progress;
@synthesize strokeColor = _strokeColor;
@synthesize valueLabel = _valueLabel;
@synthesize type = _type;
@synthesize startAngle = _startAngle;
@synthesize endAngle = _endAngle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lineWidth = 75.0f;
        self.progress = 0.0f;
        self.type = OTProgressCircleTypeTachoMeter;
        _clockwise = 1;
        self.clearsContextBeforeDrawing = YES;
//        self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(_lineWidth + _lineWidth*0.1f, rect.size.height * 0.5f * , rect.size.width-_lineWidth*2, rect.size.height*0.167)];
        
    }
    return self;
}

- (void)dealloc
{
    self.strokeColor = nil;
    self.valueLabel = nil;
    
    [super dealloc];
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    NSLog(@"Progress is being set to %f", _progress);
    // since we have changed the value of the arc, we need to redraw it
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    CGPoint centerPosition = CGPointMake(rect.origin.x + rect.size.width*0.5f, rect.origin.y + rect.size.height * 0.5f);
    CGFloat outerRadius = ((rect.size.width >= rect.size.height)? (rect.size.width -_lineWidth) * 0.5f : (rect.size.height - _lineWidth) * 0.5f);

    // fetch context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    if (self.progress == 0.0) {
        return;
    }
    
    // set properties for drawing the arc
    CGContextSetLineWidth(context, _lineWidth);
    CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);    
    
    // draw the arc
    CGContextAddArc(context, centerPosition.x, centerPosition.y, outerRadius, [self degreeToRadian:[self lerpFirstValue:self.startAngle withSecondValue:self.endAngle useTime:self.progress]], [self degreeToRadian:self.endAngle], _clockwise);
    
    CGContextStrokePath(context);

    CGContextSetLineWidth(context, _lineWidth + 2);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextAddArc(context, centerPosition.x, centerPosition.y, outerRadius,[self degreeToRadian:self.startAngle], [self degreeToRadian:[self lerpFirstValue:self.startAngle withSecondValue:self.endAngle useTime:self.progress]], _clockwise);

    
    CGContextStrokePath(context);
    
}

- (CGFloat)degreeToRadian:(CGFloat) degree;
{
    return degree * (M_PI / 180);
}

- (CGFloat)lerpFirstValue:(CGFloat)a withSecondValue:(CGFloat)b useTime:(CGFloat)time
{
    return ((1-time)*a) + (time*b);
}


@end
