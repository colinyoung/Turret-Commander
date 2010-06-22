    //
//  HighScoresVC.m
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "HighScoresVC.h"

@implementation HighScoresVC

@synthesize tableview, spinner, refresh, mode, scores;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
		self.title = @"High Scores";
		scores = [[NSArray alloc] initWithObjects:nil];
		
		/* SPINNER */
		spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
		spinner.hidesWhenStopped = YES;
		[spinner stopAnimating];

		UIBarButtonItem *spinnerItem = [[UIBarButtonItem alloc] 
										initWithCustomView:spinner];
		
		/* Refresh Button */		

		refresh = [[UIBarButtonItem alloc] 
				   initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
				   target:nil action:@selector(viewWillAppear:)];
		
		UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] 
										  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
										  target:nil action:nil];
		
		mode = MODE_ALLTIME;
		
		/* TOOLBAR */
		
		self.toolbarItems = [NSArray arrayWithObjects:spinnerItem, flexibleSpace, refresh, nil];
		[flexibleSpace release];
		
		
		
		/* Data init */
		PlistIO *plist = [[PlistIO alloc] initWithPlistNamed:@"HighScores"];
		NSArray *tmp = [plist read];
		for (NSDictionary *q in tmp) {
			NSLog(@"Name: %@, score: %d", [q valueForKey:@"Name"], [[q valueForKey:@"Score"] intValue]);
		}
		
		tmp = [tmp sortedArrayUsingSelector:@selector(scoreCompare:)];
		NSArray *reversed = [[tmp reverseObjectEnumerator] allObjects];
		scores = [[NSMutableArray alloc] initWithArray:reversed];
		NSLog(@"%d scores added", [scores count]);
		[plist release];
	}
	return self;
}

#pragma mark -
#pragma mark Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;	
}
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	NSLog(@"%d scores in section", [scores count]);
	return [scores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellID = @"Cell ID";
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];

	NSDictionary *score = [scores objectAtIndex:indexPath.row];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [[score valueForKey:@"Score"] intValue]];
	cell.textLabel.text = [score valueForKey:@"Name"];
	//[score release];
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}

#pragma mark  -
#pragma mark Cell selection methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
/*	NSArray *tmp = [NSArray arrayWithArray:scores];
	if (mode == MODE_ALLTIME) {
		tmp = [scores sortedArrayUsingSelector:@selector(scoreCompare:)];
	}
	if (mode == MODE_THISWEEK) {
		tmp = [scores sortedArrayUsingSelector:@selector(scoreCompare:)];
	}
	scores = [NSArray arrayWithArray:tmp];
	[tmp release];
	[tableview reloadData];*/
	/*self.navigationController.navigationBar.tintColor = [UIColor colorWithHue:0.6 saturation:0.33 brightness:0.69 alpha:0];*/
}


-(IBAction)switchView:(id)sender
{
	NSLog(@"switchview");
	if ([sender isKindOfClass:[UISegmentedControl class]])
	{
		switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
			case 0:
				mode = MODE_ALLTIME;
				break;
			case 1:
				mode = MODE_THISWEEK;
				break;
			default:
				break;
		}
		[self viewWillAppear:YES];
	}
}

- (void)dealloc {
    [super dealloc];
}

@end

#pragma mark -
#pragma mark Comparators


@interface NSDictionary (Support) 
- (NSComparisonResult) scoreCompare:(NSDictionary *)otherDict;
@end

@implementation NSDictionary (Support) 

// "psuedo-numeric" comparison
//   -- if both strings begin with digits, numeric comparison on the digits
//   -- if numbers equal (or non-numeric), caseInsensitiveCompare on the remainder

- (NSComparisonResult) scoreCompare:(NSDictionary *)otherDict {
	
	/* The method should return NSOrderedAscending if the receiver is
	 smaller than the argument, NSOrderedDescending if the receiver is
	 larger than the argument, and NSOrderedSame if they are equal.
	 */
	int myScore = [[self valueForKey:@"Score"] intValue];
	int otherScore = [[otherDict valueForKey:@"Score"] intValue];
	if (myScore < otherScore)
		return NSOrderedAscending;
	
	if (myScore > otherScore)
		return NSOrderedDescending;
	
	if (myScore == otherScore)
		return NSOrderedSame;
    
	return NSOrderedSame;
}
@end
