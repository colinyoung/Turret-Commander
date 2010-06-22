//
//  MainMenuView.h
//  SelectScreen
//
//  Created by Colin Young on 5/6/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "GameVC.h"
#import "MainMenuVC.h"
#import "SettingsVC.h"
#import "HighScoresVC.h"
#import "Instructions.h"

@class MainMenuVC;
@class SettingsVC;
@class GameVC;

@interface MainMenuVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	NSArray *menuItems;
	NSArray *menuImages;
	UITableView *tableView;
}
@property (nonatomic,retain) NSArray *menuItems;
@property (nonatomic,retain) NSArray *menuImages;
@property (nonatomic,retain) IBOutlet UITableView *tableView;
-(void)startGame;
-(void)show:(NSString *)nibToLoad;
@end
