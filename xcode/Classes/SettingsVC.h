//
//  SettingsVC.h
//  SelectScreen
//
//  Created by Colin Young on 5/6/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomEditableTableCell.h"
#import "ColorSettingVC.h"
#import "DifficultySettingVC.h"
#import "PlistIO.h"

// constnats
#define SETTINGSECTION_DIFFICULTY 0
#define SETTINGSECTION_NAME 1
#define SETTINGSECTION_COLOR 2

@class SettingsSubVC;

@interface SettingsVC : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
	NSArray *menuItems;
	NSIndexPath *openedCell;
	UITableView *tableview;
}
@property (nonatomic,retain) NSArray *menuItems;
@property (nonatomic,retain) NSIndexPath *openedCell;
@property (nonatomic,retain) IBOutlet UITableView *tableview;
@end
