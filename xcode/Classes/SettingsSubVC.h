//
//  SettingsSubVC.h
//  SelectScreen
//
//  Created by Colin Young on 5/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsSubVC : UIViewController {
	UILabel *reportLabel;
	UISlider *slider;
	UITextField *textfield;
}
@property (nonatomic,retain) IBOutlet UILabel *reportLabel;
@property (nonatomic,retain) IBOutlet UISlider *slider;
@property (nonatomic,retain) IBOutlet UITextField *textfield;
@end
