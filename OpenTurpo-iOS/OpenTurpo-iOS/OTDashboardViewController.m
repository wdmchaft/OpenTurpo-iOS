//
//  OTDashboardViewController.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OTDashboardViewController.h"
#import "DebugViewController.h"
#import "OTSpeedoViewController.h"
#import "OTGPSViewController.h"

@implementation OTDashboardViewController

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
    
    DebugViewController *debugViewController = [[DebugViewController alloc] initWithNibName:nil bundle:nil];
    OTSpeedoViewController *speedoViewController = [[OTSpeedoViewController alloc] initWithNibName:nil bundle:nil];
    OTGPSViewController *gpsViewController = [[OTGPSViewController alloc] initWithNibName:nil bundle:nil];
    
    [self setViewControllers:[NSArray arrayWithObjects:speedoViewController,gpsViewController ,debugViewController, nil]];
    [debugViewController release];
    [speedoViewController release];
    [gpsViewController release];
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

@end
