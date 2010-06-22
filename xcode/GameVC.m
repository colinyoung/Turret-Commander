    //
//  GameVC.m
//  SelectScreen
//
//  Created by Colin Young on 5/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "GameVC.h"


@implementation GameVC

@synthesize player, screens, tick, currentScreen, rotatedToStart, miniMap, isLooping;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		/* 
		 Initialize the player
		 */
		// grab his settings data
		PlistIO *plist = [[PlistIO alloc] initWithPlistNamed:@"SettingsMenu"];
		NSArray *settings = [plist read];
		isLooping = NO;
		
		// create player object
		player = [[Player alloc] initWithSettings:settings];
		[settings release];
		[plist release];
		
		/* View setup
			
		 */
		self.view.frame = CGRectMake(0,0,320,480);
		rotatedToStart = NO;
		/* 
		 Screens
		 */
		NSMutableArray* tmpArray = [[NSMutableArray alloc] initWithCapacity:GRID_SIZE*GRID_SIZE];
		int i, j, index;
		for (i = 0; i < GRID_SIZE; i++) {
			for (j = 0; j < GRID_SIZE; j++) {
				index = (i * GRID_SIZE) + j;
				GridScreen *tmpScreen = [[GridScreen alloc] initWithFrame:CGRectMake(0,0,480,300) andPlayer:player];
				NSString *imageName = [@"BGImage__" stringByAppendingFormat:@"0%d.png", index];
				NSLog(@"image name for this object is %@", imageName);
				
				/* Defaults for each GridScreen */
				
				// assign background image.
				tmpScreen.bgImage = imageName;
				
				[tmpArray insertObject:tmpScreen atIndex:index];
				//[tmpScreen release];
			}
			j=0;
		}
		
		tick = -3;
		
		index = 0;
		screens = [[NSMutableArray alloc] initWithArray:tmpArray];

		// load initial screen into view
		[self gotoScreen: [self middleScreen]];
		
    }
    return self;
}

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
	[player dealloc];
	[screens dealloc];
    [super dealloc];
}

-(void)clock {
	if (rotatedToStart) {
		[[screens objectAtIndex:currentScreen] updateClock:++tick];
	}
}
-(void)gotoScreen:(int)screen {
	NSLog(@"going to screen %d", screen);
	GridScreen * currScreen = nil;
	for (int i = 0; i < (GRID_SIZE*GRID_SIZE);i++) {
		if (screen == i) {
			currScreen = (GridScreen *)[screens objectAtIndex:i];			
			if (rotatedToStart) {
				
				
				// background first;
				UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:currScreen.bgImage]];
				bgView.frame = CGRectMake(0,0,480,320);
				
				for (UIView *v in self.view.subviews) {
					[v removeFromSuperview];
				}
				
				[self.view addSubview:bgView];
				[self.view sendSubviewToBack:bgView];
				
				// Grid Screen view (where all the magic happens)
				[self.view addSubview:currScreen];			
				[self.view bringSubviewToFront:currScreen];
				[bgView release];			
			} else {
				UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BGImage__start.png"]];
				[self.view addSubview:bgView];
				[self.view sendSubviewToBack:bgView];				
				bgView.frame = CGRectMake(0,0,320,460);
				[bgView release];
			}
			currScreen.isActiveScreen = YES;
		} else {
			currScreen = (GridScreen *)[screens objectAtIndex:i];
			
			currScreen.isActiveScreen = NO;
		}
	}
	[currScreen release];	
}

-(int)middleScreen {
	return 5;
}
-(void)viewWillAppear:(BOOL)animated
{
	//[[UIApplication sharedApplication] setStatusBarHidden:YES];
	[self.navigationController setNavigationBarHidden:YES animated:YES]; 	
	[self.navigationController setToolbarHidden:YES animated:YES];	
}
#pragma mark -
#pragma mark GameLoop (parent loop)
-(void)gameLoop
{
	// redraw minimap
	for (UIView*v in self.view.subviews) {
		if ([v isKindOfClass:[MiniMap class]])
			[v removeFromSuperview];
	}
	// poll gridscreens for: 
	//	-enemy locs and draw them
	//	-base healths and draw them
	
	miniMap = [[MiniMap alloc] initWithFrame:CGRectMake(0, 0, 0, 0)
		andEnemies:nil 
		andPlayers:nil
		andBases:nil];
	[self.view addSubview:miniMap];
	[miniMap setNeedsDisplay];
	// check if player needs to be transferred to new screen.
}

-(void)rotatedToLandscape {
	rotatedToStart = YES;
	// notified as having rotated, we need to handle the view movements
	[self gotoScreen: [self middleScreen]];
	[self.view setNeedsDisplay];	
	//[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clock) userInfo:nil repeats:YES];
	if (!isLooping) {
		[NSTimer scheduledTimerWithTimeInterval:FRAME_RATE*6 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
		isLooping = YES;
	}
}

-(void)rotatedToPortrait {
	
	// pause game
	UIAlertView *alert = [[UIAlertView alloc] 
		initWithTitle:@"Game Paused" message:@"The game is paused." delegate:self 
		cancelButtonTitle:@"Resume"
						  otherButtonTitles:@"Main Menu", nil];
	[alert show];
	[alert release];
	
	rotatedToStart = NO;
	// notified as having rotated, we need to handle the view movements
	[self gotoScreen: [self middleScreen]];
	[self.view setNeedsDisplay];	
	//[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clock) userInfo:nil repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval:FRAME_RATE*6 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}


#pragma mark -
#pragma mark UIAlertview delegate methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0) {
		[alertView dismissWithClickedButtonIndex:0 animated:YES];
	} else {
		[self.navigationController setNavigationBarHidden:NO animated:YES]; 	
		[self.navigationController setToolbarHidden:NO animated:YES];	

		[self.navigationController popViewControllerAnimated:YES];

	}
}

@end
