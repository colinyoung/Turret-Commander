#import "MiniMap.h"


@implementation MiniMap

@synthesize enemies, bases, players;

-(id)initWithFrame:(CGRect)rect andEnemies:(NSArray *)enemies_ andPlayers:(NSArray *)players_ andBases:(NSArray *)bases_
{
	if (self = [super init])
	{
		enemies = [NSArray arrayWithArray:enemies_];
		players = [NSArray arrayWithArray:players_];
		bases = [NSArray arrayWithArray:bases_];
		UIImageView *iv = [[UIImageView alloc ]initWithImage:[UIImage imageNamed:@"minimap.png"]];
		iv.alpha = .4;
		
		[self addSubview:iv];
		
		baseLocations[0] = CGPointMake(30, 20);
		baseLocations[1]	= CGPointMake(78, 20);
		baseLocations[2]	= CGPointMake(128, 20);
		baseLocations[3]				 = CGPointMake(30, 51);
		baseLocations[4]				 = CGPointMake(78, 51);
		baseLocations[5]				 = CGPointMake(128, 51);
		baseLocations[6]				  = CGPointMake(30, 85);
		baseLocations[7]				  = CGPointMake(78, 85);
		baseLocations[8]	 = CGPointMake(128, 85);
		
		barRects[0]  = CGRectMake(2, 4, 47, 1);
		barRects[1]				 = CGRectMake(53, 4, 47, 1);
		barRects[2]				 = CGRectMake(102, 4, 47, 1);				
		barRects[3]				 = CGRectMake(2, 37, 47, 1);
		barRects[4]				 = CGRectMake(53, 37, 47, 1);
		barRects[5]				 = CGRectMake(102, 37, 47, 1);

		barRects[6]				 = CGRectMake(2, 71, 47, 1);
		barRects[7]				 = CGRectMake(53, 71, 47, 1);
		barRects[8]	 = CGRectMake(102, 71, 47, 1);
		
	}
	return self;
}
-(void)drawRect:(CGRect)rect {
	// draw basehealth
	CGContextRef c = UIGraphicsGetCurrentContext();
	// draw base dots.
	// draw enemies
	// draw player
	int i = 0;
	for (Base *base in bases) {
		CGContextSetRGBFillColor(c, 1.0, 0, 0, 1);
		CGContextFillRect(c, CGRectMake(barRects[i].origin.x, barRects[i].origin.y, 2, 2));
		i++;
	}
}

@end
