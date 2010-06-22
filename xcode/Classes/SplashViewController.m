//
//  SplashViewController.m
//  SelectScreen
//
//  Created by Colin Young on 6/8/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "SplashViewController.h"


@implementation SplashViewController

@synthesize imageView;
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithCoder:(NSCoder *)aCoder {
    if (self = [super initWithCoder:aCoder]) {
		NSLog(@"view allocing");
		UIImageView *imageViewTemp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Splash.png"]];
		imageViewTemp.animationImages = [[NSArray arrayWithObjects:
								 [UIImage imageNamed:@"Splash.png"],
								 [UIImage imageNamed:@"Splash2.png"],
										  nil] autorelease];
        imageViewTemp.frame = CGRectMake(0, 0, 320, 460);
		imageViewTemp.userInteractionEnabled = YES;
		imageViewTemp.animationDuration = 1.0;
		imageView = imageViewTemp;
		[imageView startAnimating];
		[self.view addSubview:imageView];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void)callStopAnimating
{
	[imageView stopAnimating];
}


- (void)dealloc {
    [super dealloc];
    [imageView release];	
}


@end
