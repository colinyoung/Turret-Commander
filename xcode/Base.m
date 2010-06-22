//
//  Base.m
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "Base.h"


@implementation Base
@synthesize health, x, y;
-(id)initWithHealth:(int)health_
{
	if (self = [super init])
		self.health = health_;
	return self;
}
@end
