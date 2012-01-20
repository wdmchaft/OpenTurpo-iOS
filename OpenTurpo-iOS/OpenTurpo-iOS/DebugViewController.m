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
    /*
     ALL =             'a',
     LAMBDA =          'b',
     FUEL_PUMP_RELAY = 'c',
     AMM =             'd',
     AMM_TEMP =        'e',
     ENGINE_TEMP =     'f',
     INJECTOR_RELAY =  'g',
     DME_RELAY =       'h',
     RPM =             'i',
     FUEL_CONSUMPTION = 'j',
     FAN_LO =          'k',
     FAN_HI =          'l'
*/
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
     
    UILabel *rpmLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, 300, 20)];
    
    rpmLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    rpmLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    rpmLabel.textColor = [UIColor blackColor];
    rpmLabel.text = @"RPM: ";
    
    [self.view addSubview:rpmLabel];
    [rpmLabel release];
    
    UILabel *lambdaLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 55, 300, 20)];
    lambdaLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    lambdaLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    lambdaLabel.textColor = [UIColor blackColor];
    lambdaLabel.text = @"Lamda: ";

    [self.view addSubview:lambdaLabel];
    [lambdaLabel release];
    
    UILabel *fuelPumpRelayLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 85, 300, 20)];
    fuelPumpRelayLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    fuelPumpRelayLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    fuelPumpRelayLabel.textColor = [UIColor blackColor];
    fuelPumpRelayLabel.text = @"Fuel pump relay: ";
    
    [self.view addSubview:fuelPumpRelayLabel];
    [fuelPumpRelayLabel release];
    
    UILabel *airMassMeterLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 115, 300, 20)];
    airMassMeterLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    airMassMeterLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    airMassMeterLabel.textColor = [UIColor blackColor];
    airMassMeterLabel.text = @"Air Mass Meter: ";
    
    [self.view addSubview:airMassMeterLabel];
    [airMassMeterLabel release];
    
    UILabel *airMassMeterTemperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 145, 300, 20)];
    airMassMeterTemperatureLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    airMassMeterTemperatureLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    airMassMeterTemperatureLabel.textColor = [UIColor blackColor];
    airMassMeterTemperatureLabel.text = @"Air Mass Meter Temperature: ";
    
    [self.view addSubview:airMassMeterTemperatureLabel];
    [airMassMeterTemperatureLabel release];
    
    UILabel *engineTemperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 175, 300, 20)];
    engineTemperatureLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    engineTemperatureLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    engineTemperatureLabel.textColor = [UIColor blackColor];
    engineTemperatureLabel.text = @"Engine Temperature: ";
    
    [self.view addSubview:engineTemperatureLabel];
    [engineTemperatureLabel release];
    
    UILabel *injectorRelayLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 205, 300, 20)];
    injectorRelayLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    injectorRelayLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    injectorRelayLabel.textColor = [UIColor blackColor];
    injectorRelayLabel.text = @"Injector Relay: ";
    
    [self.view addSubview:injectorRelayLabel];
    [injectorRelayLabel release];
    
    UILabel *dmeRelayLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 235, 300, 20)];
    dmeRelayLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    dmeRelayLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    dmeRelayLabel.textColor = [UIColor blackColor];
    dmeRelayLabel.text = @"DME Relay: ";
    
    [self.view addSubview:dmeRelayLabel];
    [dmeRelayLabel release];
    
    UILabel *fuelConsumptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 265, 300, 20)];
    fuelConsumptionLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    fuelConsumptionLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    fuelConsumptionLabel.textColor = [UIColor blackColor];
    fuelConsumptionLabel.text = @"Fuel Consumption";
    
    [self.view addSubview:fuelConsumptionLabel];
    [fuelConsumptionLabel release];
    
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
