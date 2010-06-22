#import "BlueButton.h"

@implementation BlueButton

-(id)init {
	if(self = [super init]) {
		
		// The default size for the save button is 49x30 pixels
		self.frame = CGRectMake(0, 0, 49.0, 30.0);
		
		// Center the text vertically and horizontally
		self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		
		UIImage *image = [UIImage imageNamed:@"blueButton.png"];
		
		// Make a stretchable image from the original image
		UIImage *stretchImage = 
		[image stretchableImageWithLeftCapWidth:15.0 topCapHeight:0.0];
		
		// Set the background to the stretchable image
		[self setBackgroundImage:stretchImage forState:UIControlStateNormal];
		
		// Make the background color clear
		self.backgroundColor = [UIColor clearColor];
		
		// Set the font properties
		[self setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
		self.titleShadowOffset = CGSizeMake(0, -1);
		self.font = [UIFont boldSystemFontOfSize:13];
	}
	
	return self;
}

@end
