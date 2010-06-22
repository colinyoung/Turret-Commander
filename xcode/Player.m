#import "Player.h"


@implementation Player

@synthesize name, difficulty, color, points, pos;

-(id)initWithSettings:(NSArray *)settings
{
	if (self = [super init]) {
	color = @"Blue";
	name = @"DefaultPlayerName";
	difficulty = @"Easy";
	for (NSDictionary *item in settings) {
		// Game Difficulty
		if ([[item objectForKey:@"Label"] isEqualToString:@"Game Difficulty"])
		{
			difficulty = [item objectForKey:@"Value"];
		}
		
		// Name
		if ([[item objectForKey:@"Label"] isEqualToString:@"Your Name"])
		{
			name = [item objectForKey:@"Value"];
		}
		
		// Color
		if ([[item objectForKey:@"Label"] isEqualToString:@"Turret Color"])
		{
			
			color = [item objectForKey:@"Value"];
		}
	}
		NSLog(@"player inited with name: %@, color: %@, difficulty: %@", name, color, difficulty);
		
	}
	NSLog(@"leaving player");
	pos = CGPointMake(480/2, 300/2);
	return self;
}

@end
