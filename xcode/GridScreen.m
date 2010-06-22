//
//  GridScreen.m
//  SelectScreen
//
//  Created by Colin Young on 5/20/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "GridScreen.h"

#define SWIPE_DRAG_MIN  12
#define SWIPE_DRAG_MAX    4

@implementation GridScreen

@synthesize blockedSides, bases, player, enemies, tick, screenId, isActiveScreen, bgImage, startTouch;

- (id)initWithFrame:(CGRect)frame andPlayer:(Player *)p {
    if ((self = [super initWithFrame:frame])) {
		// multitouch
		self.multipleTouchEnabled = YES;
		self.opaque = NO;
		
		Base *theBase = [[Base alloc] initWithHealth:100];
        bases = [[NSMutableArray alloc] initWithObjects:theBase, nil];
		[theBase release];
		
		
		player = [[PlayerDisplay alloc] initWithPos:CGPointMake((480/2), (320/2)) andColor:p.color];
		
		[NSTimer scheduledTimerWithTimeInterval:FRAME_RATE target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];		
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
	if (!isActiveScreen)
		return;
	
	//CGContextRef c = UIGraphicsGetCurrentContext();	
	
	// draw player
	NSString* fileNameItself = [NSString stringWithFormat:@"Player_%@.png", @"Blue"];
	UIImage *playerImg = [UIImage imageNamed:fileNameItself];
	//playerImg = [self rotateImage:playerImg degrees:45];
	[playerImg drawAtPoint:CGPointMake(player.pos.x, player.pos.y)];
}


#pragma mark -
#pragma mark GameLoop
-(void)gameLoop {
	// always:
	// - update enemy positions
	// - do collisions for enemies
	// - update base health
	
	// ONLY if active:
	if (isActiveScreen) {
		// update player
		// draw player attacks
		// do collisions for player
		//		-> handoff to next screen if needed.
		[self setNeedsDisplay];
	}
}

#pragma mark -
#pragma mark Touch handling
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{		
	UITouch *touch = [touches anyObject];
	startTouch = [touch locationInView:self];
	CGPoint point = startTouch;
	player.pos = CGPointMake(point.x-25, point.y-30);
	//[player rotateToPoint:CGPointMake(point.x,point.y)];
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{		
	UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView:self];
	player.pos = CGPointMake(point.x-25, point.y-30);
}


#pragma mark -
#pragma mark Timer functions
-(void)updateClock:(int)seconds
{
	tick = seconds;
}

- (void)dealloc {
	[blockedSides release];
	[bases release];
	[player release];
	[enemies release];
    [super dealloc];
}

#pragma mark -
#pragma mark Getters of datamembers
/*-(Player *)player:(int)which
{
	return [self.players objectAtIndex:which];
}*/
-(Base *)base:(int)which
{
	return [self.bases objectAtIndex:which];	
}
-(NSArray *)enemies
{
	return self.enemies;
}

-(UIImage*)rotateImage:(UIImage *)image degrees:(double)degrees_
{
    UIGraphicsBeginImageContext(image.size);
	
    CGContextRef context = UIGraphicsGetCurrentContext();
	
    CGContextRotateCTM (context, radians(degrees_));
	
    [image drawAtPoint:CGPointMake(0, 0)];
	
    return UIGraphicsGetImageFromCurrentImageContext();
}

@end