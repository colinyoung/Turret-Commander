//
//  MainViewController.h
//  SelectScreen
//
//  Created by Colin Young on 5/4/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SoundPlayer.h"
#import "SplashViewController.h"
#import "SettingsVC.h"
#import "GameVC.h"
@class SettingsVC;
//@class SoundPlayer;
@class SplashViewController;

@interface MainViewController : UIViewController <UINavigationBarDelegate, UINavigationControllerDelegate> {
	UINavigationController *mainNavController;
	SplashViewController *splashViewController;
//	SoundPlayer *soundPlayer;
	BOOL orientationLocked;
}

@property(nonatomic,retain) IBOutlet UINavigationController *mainNavController;
@property(nonatomic,retain) IBOutlet UIViewController *splashViewController;
//@property(nonatomic,retain) IBOutlet SoundPlayer *soundPlayer;
@property(assign) BOOL orientationLocked;
-(IBAction)settingsButton:(id)sender;
-(void)loadMainMenu;
@end