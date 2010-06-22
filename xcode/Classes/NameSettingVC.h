#import <UIKit/UIKit.h>
#define SETTINGS_INDEX_FOR_VC 1

@interface NameSettingVC : UIViewController {
	UITextField *textfield;
	NSDictionary *dict;
}
@property (nonatomic, retain) IBOutlet UITextField *textfield;
@property (nonatomic, retain) NSDictionary *dict;
-(IBAction)doneEditing:(id)sender;
@end
