//
//  PlayerDisplay.m
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "PlayerDisplay.h"


@implementation PlayerDisplay

@synthesize pos, colorName, rotation;

-(id)initWithPos:(CGPoint)pos_ andColor:(NSString *)color_
{		
	if (self = [super init])
	{
		pos = pos_;
		colorName = color_;
	}
	return self;
}
-(void)rotateToPoint:(CGPoint)point
{
	
}
@end
