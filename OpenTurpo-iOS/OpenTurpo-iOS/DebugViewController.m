//
//  DebugViewController.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DebugViewController.h"

@interface DebugViewController ()

- (void) insertLabelWithText:(NSString*)text andWithFrame:(CGRect) frame;

@end

@implementation DebugViewController

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"TURPÅÅÅÅH";
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
     
    [self insertLabelWithText:@"RPM: " andWithFrame:CGRectMake(15, 25, 300, 20)];
    [self insertLabelWithText:@"Lamda: " andWithFrame:CGRectMake(15, 55, 300, 20)];
    [self insertLabelWithText:@"Fuel Pump Relay: " andWithFrame:CGRectMake(15, 85, 300, 20)];
    [self insertLabelWithText:@"Air Mass Meter" andWithFrame:CGRectMake(15, 115, 300, 20)];
    [self insertLabelWithText:@"Air Mass Meter Temperature: " andWithFrame:CGRectMake(15, 145, 300, 20)];
    [self insertLabelWithText:@"Engine Temperature: " andWithFrame:CGRectMake(15, 175, 300, 20)];
    [self insertLabelWithText:@"Injector Relay: " andWithFrame:CGRectMake(15, 205, 300, 20)];
    [self insertLabelWithText:@"DME Relay" andWithFrame:CGRectMake(15, 235, 300, 20)];
    [self insertLabelWithText:@"Fuel Consumption: " andWithFrame:CGRectMake(15, 265, 300, 20)];
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 768, 44)];
    
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *leftFlexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *secondLeftFlexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *title = [[UIBarButtonItem alloc] initWithTitle:self.title style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem *rightFlexibleSpace  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *secondRightFlexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    		
    toolbar.items = [NSArray arrayWithObjects:leftFlexibleSpace, secondLeftFlexibleSpace, title, rightFlexibleSpace, secondRightFlexibleSpace, nil];
    
    [leftFlexibleSpace release];
    [secondLeftFlexibleSpace release];
    [title release];
    [rightFlexibleSpace release];
    [secondRightFlexibleSpace release];
    
    [self.view addSubview:toolbar];
    [toolbar release];
    
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

#pragma mark Private functions
- (void) insertLabelWithText:(NSString*)text andWithFrame:(CGRect)frame
{
    UILabel *textLabel = [[UILabel alloc] initWithFrame:frame];
    textLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    textLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    textLabel.textColor = [UIColor blackColor];
    textLabel.text = text;
    
    [self.view addSubview:textLabel];
    [textLabel release];

}

@end
