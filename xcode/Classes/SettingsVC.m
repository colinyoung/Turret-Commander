    //
//  SettingsVC.m
//  SelectScreen
//
//  Created by Colin Young on 5/6/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "SettingsVC.h"


@implementation SettingsVC

@synthesize menuItems;
@synthesize openedCell;
@synthesize tableview;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		self.title = @"Game Settings";
		openedCell = nil;
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	PlistIO *plist = [[PlistIO alloc ] initWithPlistNamed:@"SettingsMenu"];
	self.menuItems = [plist read];
	[plist release];
	NSLog(@"view did load");
    [super viewDidLoad];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
			interfaceOrientation == UIInterfaceOrientationLandscapeRight
			);
}


#pragma mark -
#pragma mark Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	NSLog(@"%d", [menuItems count]);
	return [menuItems count];
}
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return 1;
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [[menuItems objectAtIndex:section] valueForKey:@"Label"];
}*/

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	return [[menuItems objectAtIndex:section] valueForKey:@"Footer"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"cell for row at %d", indexPath.row);
	NSString *cellID = @"Cell ID";
	NSString *cellID2 = @"Cell ID2";	
	NSDictionary *thisDict = [menuItems objectAtIndex:indexPath.section];	
	
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
	CustomEditableTableCell *cell2 = (CustomEditableTableCell *) [tableView dequeueReusableCellWithIdentifier:cellID2];
	cell2.selectionStyle = UITableViewCellSelectionStyleNone;
	// add custom style for Your Name editable table cell
	if ([[thisDict objectForKey:@"Label"] isEqualToString:@"Your Name"]) {
		
		if (cell2 == nil) {
			NSArray *topLevelObjects = [[NSBundle mainBundle]
										loadNibNamed:@"CustomEditableTableCell" 
										owner:nil options:nil];
			for (id currentObject in topLevelObjects) {
				if ([currentObject isKindOfClass:[CustomEditableTableCell class]]) {
					cell2 = (CustomEditableTableCell *) currentObject;
					break;
				}
			}
		}
		
		cell2.textLabel.text = [thisDict objectForKey:@"Label"];
		cell2.selectionStyle = UITableViewCellSelectionStyleNone;
		@try {
			cell2.rightTextField.text = [NSString stringWithFormat:@"%@", [thisDict objectForKey:@"Value"]];		
		} @catch (NSException *e) {
			NSLog(@"exception on traceback, section was : %d", indexPath.section);
		} 
		[cell release];
		[cellID release];
		[cellID2 release];
		//[thisDict release];
		return cell2;
	} else {
		cell.textLabel.text = [thisDict objectForKey:@"Label"];
		cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [thisDict objectForKey:@"Value"]];		
		[cell2 release];
		[cellID release];
		[cellID2 release];
		//[thisDict release];		
		return cell;
	}
	return cell;
}
#pragma mark -
#pragma mark Delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSArray *allRows = [tableView indexPathsForVisibleRows];
	for (NSIndexPath *row in allRows) {
		[tableView deselectRowAtIndexPath:row animated:YES];
	}
	
	NSString *nibToLoad = [[menuItems objectAtIndex:indexPath.section] objectForKey:@"Nib"];
	NSLog(@"'%@'", nibToLoad);
	if ([nibToLoad isEqualToString:@"DifficultySetting"]) {
		
		
		DifficultySettingVC *newVC = [[DifficultySettingVC alloc] initWithNibName:nibToLoad bundle:nil];
		NSString *tmp = [[menuItems objectAtIndex:indexPath.section] objectForKey:@"Value"];
		[self.navigationController pushViewController:newVC animated:YES];
		[newVC setInitialSliderValue:tmp];	
		
		[nibToLoad release];
		[tmp release];		
		
		
	} else if ([nibToLoad isEqualToString:@"ColorSetting"]) {
		ColorSettingVC *newVC = [[ColorSettingVC alloc] initWithNibName:nibToLoad bundle:nil];
		[self.navigationController pushViewController:newVC animated:YES];
		[nibToLoad release];		
		[newVC release];
	} else if ([nibToLoad isEqualToString:@"NameSetting"]) {
		
	} else {
		
		return;
	}
		
	
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	self.openedCell = nil;
}

- (void)dealloc {
	[menuItems release];
	[openedCell release];
	[tableview release];
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated
{
	[self viewDidLoad];
	[tableview reloadData];
}

@end
