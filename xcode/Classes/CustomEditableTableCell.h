//
//  CustomEditableTableCell.h
//  SelectScreen
//
//  Created by Colin Young on 5/20/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlistIO.h"


@interface CustomEditableTableCell : UITableViewCell <UITextFieldDelegate> {
	UITextField *rightTextField;
	UILabel *textLabel;	
	UIAlertView *errorAlert;
}
@property(nonatomic, retain) IBOutlet UITextField *rightTextField;
@property(nonatomic, retain) IBOutlet UILabel *textLabel;
@property(nonatomic, retain) UIAlertView *errorAlert;
-(IBAction)stopEditing:(id)sender;
-(void)save;
@end
