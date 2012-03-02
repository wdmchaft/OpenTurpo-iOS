//
//  OTCircularTextView.h
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTCircularTextView : UIView
{
    NSMutableDictionary *_textArray;
    UIColor *_textColor;
    UIColor *_fadeColor;
    CGFloat _startAngle;
    CGFloat _endAngle;
}

@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIColor *fadeColor;
@property (nonatomic, assign) CGFloat startAngle;
@property (nonatomic, assign) CGFloat endAngle;


- (void) addText: (NSString*) text withKeyAngle:(NSNumber *) angle;

@end
