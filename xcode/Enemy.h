//
//  Enemy.h
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Enemy : NSObject {
	@public
	int health;
	float speedX;
	float speedY;
	CGFloat x;
	CGFloat y;
}
-(id)initWithHealth:(int)health_;
@property(assign) int health;
@property(assign) float speedX;
@property(assign) float speedY;
@property(assign) CGFloat x;
@property(assign) CGFloat y;
@end
