//
//  DifficultySettingVC.h
//  SelectScreen
//
//  Created by Colin Young on 5/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlistIO.h"
#import "BlueButton.h"

@interface ColorSettingVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	NSArray *cells;
	NSString *current;
}
@property(nonatomic,retain) NSArray *cells;
@property(nonatomic,retain) NSString *current;
-(void)save;
@end
