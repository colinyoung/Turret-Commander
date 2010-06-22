//
//  DifficultySettingVC.h
//  SelectScreen
//
//  Created by Colin Young on 5/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlueButton.h"
#import "PlistIO.h"

@interface DifficultySettingVC : UIViewController {
	UISlider *slider;
	UILabel *label;	
	NSDictionary *difficulties;
	
	int sliderValue;
}
-(void)setInitialSliderValue:(NSString *)val;
-(IBAction)sliderValueChanged:(id)sender;
-(void)save;
@property(nonatomic,retain) IBOutlet UISlider *slider;
@property(nonatomic,retain) IBOutlet UILabel *label;
@property(nonatomic,retain) NSDictionary *difficulties;
@property (assign) int sliderValue;
@end
