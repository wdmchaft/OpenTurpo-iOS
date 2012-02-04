//
//  OTSpeedoViewController.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OTSpeedoViewController.h"
#import "OTProgressCircle.h"

@interface OTSpeedoViewController ()
{
    OTProgressCircle *_circleProgressBar;
}
- (void)circleSliderAction:(id)sender;

@end

@implementation OTSpeedoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Speedo";
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    OTProgressCircle *circle = [[OTProgressCircle alloc] initWithFrame:CGRectMake(250, 75, 500, 500)];
    [self.view addSubview:circle];
    circle.strokeColor = [UIColor cyanColor];
    _circleProgressBar = circle;
    circle.startAngle = 160;
    circle.endAngle = 360;

    [circle release];
    
    
    UISlider *circleSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 50, 300, 30)];
    
    [circleSlider addTarget:self action:(@selector(circleSliderAction:)) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:circleSlider];
    [circleSlider release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Button actions
- (void)circleSliderAction:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    
    [_circleProgressBar setProgress:slider.value];
}

@end
