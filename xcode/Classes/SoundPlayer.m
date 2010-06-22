//
//  SoundPlayer.m
//  SelectScreen
//
//  Created by Colin Young on 5/4/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "SoundPlayer.h"


@implementation SoundPlayer

@synthesize player;

-(id)initWithSoundNamed:(NSString *)soundName {
	
	if (self = [super init]) {
		NSString *soundFilePath =
		
		[[NSBundle mainBundle] pathForResource: soundName
		 
										ofType: @"aif"];
		
		NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
		AVAudioPlayer *newPlayer =
		
		[[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
		 
											   error: nil];
		[fileURL release];
		
		
		
		self.player = newPlayer;
		
		[newPlayer release];
		
		[player prepareToPlay];
		
		[player setDelegate: self];		
		
	}
	return self;
}
+(void) vibratePhone {
	
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
	
}
-(void)playCachedSound {
	[self.player play];
}
@end
