    //
//  MainViewController.m
//  SelectScreen
//
//  Created by Colin Young on 5/4/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize mainNavController;
@synthesize splashViewController;
//@synthesize soundPlayer;
@synthesize orientationLocked;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        
		
		/* 1. cache the blast sound
		SoundPlayer *sp = [[SoundPlayer alloc] initWithSoundNamed:@"blast"];
		self.soundPlayer = sp;
		[sp release];*/	
		
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	// Custom initialization
	[self.view addSubview:splashViewController.view];
	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (splashViewController != nil) {
		[splashViewController callStopAnimating];
		[self loadMainMenu];
		splashViewController = nil;
	}
}

-(void)loadMainMenu
{
	//[self.soundPlayer playCachedSound];
	//[SoundPlayer vibratePhone];
		
	// fade animation
	[splashViewController callStopAnimating];
	
	// this fades to the main menu
	[self.view insertSubview:mainNavController.view atIndex:0];
	[mainNavController.view setFrame:CGRectMake(0,-20,320,480)];	// for some reason, it's adding it wrong...so I had to compensate.
	splashViewController.view.alpha = 1.0;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	splashViewController.view.alpha = 0.0;
	
	
	[UIView commitAnimations];
	[splashViewController release];
}
#pragma mark -
#pragma mark Events for viewController

- (void)navigationController:(UINavigationController *)navigationController 
	   willShowViewController:(UIViewController *)viewController 
					animated:(BOOL)animated
{
	[viewController viewWillAppear:animated];
	
	if ([viewController isKindOfClass:[GameVC class]]) {
		orientationLocked = NO;
	} else {
		orientationLocked = YES;
	}
}

#pragma mark  -
#pragma mark Toolbar button items
-(IBAction)settingsButton:(id)sender
{	
	SettingsVC *tmp = [[SettingsVC alloc] initWithNibName:@"Settings" bundle:nil];
	[mainNavController pushViewController:tmp animated:YES];
	[splashViewController release];
	[tmp release];	
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	if (!orientationLocked || toInterfaceOrientation == UIInterfaceOrientationPortrait) {
		if (toInterfaceOrientation == UIInterfaceOrientationPortrait ||
			toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
		{
			return YES;
		} else {
			return NO;
		}
	} else {
		return NO;
	}

}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	orientationLocked = YES;
	for (GameVC *vc in mainNavController.viewControllers) {
		if ([vc isKindOfClass:[GameVC class]])
		{
			vc = (GameVC *)vc;
			if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
				orientationLocked = NO;
				[vc rotatedToPortrait];
			} else {
				[vc rotatedToLandscape];
			}
		}
	}
}
@end
