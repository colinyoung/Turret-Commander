//
//  SelectScreenAppDelegate.m
//  SelectScreen
//
//  Created by Colin Young on 5/4/10.
//  Copyright Shortwave Design 2010. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;
@synthesize mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
	// show status bar (it's hidden at launch)
	[UIApplication sharedApplication].statusBarHidden = NO;
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
	
	[window addSubview:mainViewController.view];
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
