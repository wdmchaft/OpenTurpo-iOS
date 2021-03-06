//
//  OTProgressCircle.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OTProgressCircle.h"
#import "OTMath.h"

@interface OTProgressCircle () 
{
    CGFloat _clockwise;
}


@end
@implementation OTProgressCircle

@synthesize lineWidth = _lineWidth;
@synthesize progress = _progress;
@synthesize strokeColor = _strokeColor;
@synthesize warningColor = _warningColor;
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
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)dealloc
{
    self.strokeColor = nil;
    self.warningColor = nil;
    self.valueLabel = nil;
    
    [super dealloc];
}

- (void)setProgress:(CGFloat)progress
{
    if (progress == 1.0f) {
        progress = 0.98f;
    }
    _progress = progress;
    NSLog(@"Progress is being set to %f", _progress);
    // since we have changed the value of the arc, we need to redraw it
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if (self.progress == 1.0) {
        return;
    }
    
    CGPoint centerPosition = CGPointMake(rect.origin.x + rect.size.width*0.5f, rect.origin.y + rect.size.height * 0.5f);
    CGFloat outerRadius = ((rect.size.width >= rect.size.height)? (rect.size.width -_lineWidth) * 0.5f : (rect.size.height - _lineWidth) * 0.5f);

    // fetch context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    if (self.progress == 0.0) {
        return;
    }
    
    CGFloat r, g, b;
    
    
    CIColor *strokeColor = [CIColor colorWithCGColor:self.strokeColor.CGColor];
    CIColor *warningColor = [CIColor colorWithCGColor:self.warningColor.CGColor];
    
    r = [OTMath lerpFirstValue:strokeColor.red withSecondValue:warningColor.red useTime:self.progress];
    g = [OTMath lerpFirstValue:strokeColor.green withSecondValue:warningColor.green useTime:self.progress];
    b = [OTMath lerpFirstValue:strokeColor.blue withSecondValue:warningColor.blue useTime:self.progress];
    
    UIColor *finalColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
    
    // set properties for drawing the arc
    CGContextSetLineWidth(context, _lineWidth);
    CGContextSetStrokeColorWithColor(context, finalColor.CGColor);    
    
    // draw the arc
    CGContextAddArc(context, centerPosition.x, centerPosition.y, outerRadius, [OTMath degreeToRadian:[OTMath lerpFirstValue:self.startAngle withSecondValue:self.endAngle useTime:self.progress]], [OTMath degreeToRadian:self.endAngle], _clockwise);
    
    CGContextStrokePath(context);

    // draw the cover up arc
    CGContextSetLineWidth(context, _lineWidth + 2);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextAddArc(context, centerPosition.x, centerPosition.y, outerRadius,[OTMath degreeToRadian:self.startAngle], [OTMath degreeToRadian:[OTMath lerpFirstValue:self.startAngle withSecondValue:self.endAngle useTime:self.progress]], _clockwise);

    
    CGContextStrokePath(context);
    
}

@end
