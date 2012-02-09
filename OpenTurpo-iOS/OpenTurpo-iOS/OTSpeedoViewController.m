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
    OTProgressCircle *_speedoProgressBar;
    OTProgressCircle *_tachoProgressBar;
    OTProgressCircle *_turboProgressBar;
}
- (void)speedoSliderAction:(id)sender;
- (void)tachoSliderAction:(id)sender;
- (void)turboSliderAction:(id)sender;

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
    
    OTProgressCircle *speedo = [[OTProgressCircle alloc] initWithFrame:CGRectMake(100, 25, 300, 300)];
    [self.view addSubview:speedo];
    speedo.strokeColor = [UIColor cyanColor];
    speedo.warningColor = [UIColor redColor];
    _speedoProgressBar = speedo;
    speedo.startAngle = 100;
    speedo.endAngle = 400;
    speedo.lineWidth = 15.0f;
    [speedo release];
    
    OTProgressCircle *tacho = [[OTProgressCircle alloc] initWithFrame:CGRectMake(312, 25, 400, 400)];
    [self.view addSubview:tacho];
    tacho.strokeColor = [UIColor cyanColor];
    tacho.warningColor = [UIColor redColor];
    _tachoProgressBar = tacho;
    tacho.startAngle = 160;
    tacho.endAngle = 360;
    
    [tacho release];
    
    OTProgressCircle *turbo = [[OTProgressCircle alloc] initWithFrame:CGRectMake(712, 25, 200, 200)];
    [self.view addSubview:turbo];
    turbo.strokeColor = [UIColor cyanColor];
    turbo.warningColor = [UIColor redColor];
    _turboProgressBar = turbo;
    turbo.startAngle = 225;
    turbo.endAngle = 315;
    turbo.lineWidth = 12.0f;
    [turbo release];
    
    
    UISlider *speedoSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 630, 300, 30)];
    
    [speedoSlider addTarget:self action:(@selector(speedoSliderAction:)) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:speedoSlider];
    [speedoSlider release];
    
    UISlider *tachoSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 650, 300, 30)];
    
    [tachoSlider addTarget:self action:(@selector(tachoSliderAction:)) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:tachoSlider];
    [tachoSlider release];
    
    UISlider *turboSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 670, 300, 30)];
    
    [turboSlider addTarget:self action:(@selector(turboSliderAction:)) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:turboSlider];
    [turboSlider release];
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
- (void)speedoSliderAction:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    
    [_speedoProgressBar setProgress:slider.value];
}

- (void)tachoSliderAction:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    
    [_tachoProgressBar setProgress:slider.value];
}

- (void)turboSliderAction:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    
    [_turboProgressBar setProgress:slider.value];
}

@end
