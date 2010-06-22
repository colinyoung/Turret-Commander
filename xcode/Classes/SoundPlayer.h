#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface SoundPlayer : NSObject <AVAudioPlayerDelegate>{
	AVAudioPlayer *player;
}
@property (nonatomic, retain) AVAudioPlayer *player;
-(id)initWithSoundNamed:(NSString *)soundName;
-(void)playCachedSound;
+(void)vibratePhone;
@end
