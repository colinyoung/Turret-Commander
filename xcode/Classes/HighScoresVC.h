//
//  HighScoresVC.h
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlistIO.h"
#define MODE_ALLTIME 0
#define MODE_THISWEEK 1

@interface HighScoresVC : UIViewController<UITableViewDelegate, UITableViewDataSource> {
	UITableView *tableview;
	UIActivityIndicatorView *spinner;
	UIBarButtonItem *refresh;
	int mode;
	
	// temp data members to be removed when network is working
	NSMutableArray *scores;
}
-(IBAction)switchView:(id)sender;
@property (nonatomic,retain) IBOutlet UITableView *tableview;
@property (nonatomic,retain) UIActivityIndicatorView *spinner;
@property (nonatomic,retain) UIBarButtonItem *refresh;
@property (nonatomic,retain) NSMutableArray *scores;
@property (assign) int mode;
@end