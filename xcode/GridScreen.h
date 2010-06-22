//
//  GridScreen.h
//  SelectScreen
//
//  Created by Colin Young on 5/20/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <AVFoundation/AVFoundation.h>
#import "Base.h"
#import "Enemy.h"
#import "Player.h"
#import "PlayerDisplay.h"
#import "Constants.h"
#import "AppDelegate.h"

@interface GridScreen : UIView {
	NSMutableArray *enemies;
	NSMutableArray *bases;
	NSArray *blockedSides;
	int tick;
	PlayerDisplay *player;
	CGPoint startTouch;
	@public
	NSString *bgImage;
	BOOL isActiveScreen;
	int screenId;
}
-(void)updateClock:(int)seconds;
/*-(Player *)player:(int)which;*/
-(Base *)base:(int)which;
-(NSArray *)enemies;
- (id)initWithFrame:(CGRect)frame andPlayer:(Player *)p;
-(UIImage *)rotateImage:(UIImage *)image degrees:(double)degrees_;
@property(nonatomic,retain) NSMutableArray *enemies;
@property(nonatomic,retain) NSMutableArray *bases;
@property(nonatomic,retain) NSArray *blockedSides;
@property(nonatomic,retain) NSString *bgImage;
@property(nonatomic,retain) PlayerDisplay *player;
@property(assign) int tick;
@property(assign) CGPoint startTouch;
@property(assign) int screenId;
@property(assign) BOOL isActiveScreen;
@end
