//
//  GameVC.h
//  SelectScreen
//
//  Created by Colin Young on 5/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "GridScreen.h"
#import "PlistIO.h"
#import "Constants.h"
#import "MiniMap.h"

#define GRID_SIZE 3

@interface GameVC : UIViewController <UIAlertViewDelegate> {
	Player *player;
	NSMutableArray *screens;
	MiniMap *miniMap;
	int currentScreen;
	int tick;
	BOOL rotatedToStart;
	BOOL isLooping;
}
-(void)gotoScreen:(int)screen;
-(int)middleScreen;
-(void)clock;
-(void)gameLoop;
-(void)rotatedToLandscape;
-(void)rotatedToPortrait;
@property(nonatomic, retain) Player *player;
@property(nonatomic, retain) MiniMap *miniMap;
@property(nonatomic, retain) NSMutableArray *screens;
@property(assign) int tick;
@property(assign) int currentScreen;
@property(assign) BOOL rotatedToStart;
@property(assign) BOOL isLooping;
@end
