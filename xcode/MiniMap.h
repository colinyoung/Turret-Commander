//
//  MiniMap.h
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Base.h"
#import "Player.h"
#import "Enemy.h"

#define BAR_MAX_WIDTH 47

@interface MiniMap : UIView {
	NSArray *enemies;
	NSArray *players;	
	NSArray *bases;
	@public
	CGPoint baseLocations[9];
	CGRect barRects[9];
}
-(id)initWithFrame:(CGRect)rect andEnemies:(NSArray *)enemies_ andPlayers:(NSArray *)players_ andBases:(NSArray *)bases_;
@property(nonatomic,retain) 	NSArray *enemies;
@property(nonatomic,retain) NSArray *players;	
@property(nonatomic,retain) NSArray *bases;	
@end
