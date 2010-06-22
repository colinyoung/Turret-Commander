//
//  Enemy.m
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "Enemy.h"


@implementation Enemy

@synthesize speedX, speedY, x, y, health;

-(id)initWithHealth:(int)health_
{
	if (self = [super init]) {
	health = health_;
	}
	return self;
}
@end
