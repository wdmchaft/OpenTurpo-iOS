//
//  DebugViewController.m
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DebugViewController.h"

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
     
    UILabel *rpmLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 300, 200)];
    
    rpmLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    rpmLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    rpmLabel.textColor = [UIColor blackColor];
    rpmLabel.text = @"RPM: ";
    
    [self.view addSubview:rpmLabel];
    [rpmLabel release];
    
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

@end
