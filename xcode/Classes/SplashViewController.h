#import <UIKit/UIKit.h>


@interface SplashViewController : UIViewController {
	UIImageView *imageView;
}
@property(nonatomic,retain) UIImageView *imageView;
-(void)callStopAnimating;
@end
