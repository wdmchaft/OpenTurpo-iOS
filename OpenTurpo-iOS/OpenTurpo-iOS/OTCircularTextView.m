//
//  OTCircularTextView.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OTCircularTextView.h"

@implementation OTCircularTextView

@synthesize textColor = _textColor;
@synthesize fadeColor = _fadeColor;
@synthesize startAngle = _startAngle;
@synthesize endAngle = _endAngle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setRadius:10.0f];
    }
    return self;
}

- (void) dealloc
{
    _textColor = nil;
    _fadeColor = nil;
    [_textArray removeAllObjects];
    _textArray = nil;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Draw a number of texts placed in _textArray in a circle.
    [_textArray enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
        NSLog(@"Logging cool stuff %@, %@", key, obj);
    }];
}

- (void) addText: (NSString*) text withKeyAngle:(NSNumber *) angle
{
    NSLog(@"addTextWithKeyAngle is not yet implemented...");
    
}

- (void) setRadius: (CGFloat) radius
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, radius, radius);
}

@end
