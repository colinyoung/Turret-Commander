    //
//  DifficultySettingVC.m
//  SelectScreen
//
//  Created by Colin Young on 5/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "ColorSettingVC.h"


@implementation ColorSettingVC

@synthesize cells, current;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		NSArray *tmp = [NSArray arrayWithObjects:
						@"Blue", 
						@"Yellow",
						@"Red",
						@"Green",
						nil];
		self.cells = tmp;
		
		// read current value
		PlistIO *plist = [[PlistIO alloc] initWithPlistNamed:@"SettingsMenu"];
		NSArray *tmpA = [plist read];
		current = [[tmpA objectAtIndex:[plist getIndexWithLabel:@"Turret Color"]] valueForKey:@"Value"];
		NSLog(@"color is currently: %@", current);
		[plist release];
		//[tmp release];
		
		// set ok button
		BlueButton *blueSaveButton = [[BlueButton alloc] init];
		
		[blueSaveButton setTitle:@"Save" forState:UIControlStateNormal];
		
		[blueSaveButton addTarget:self action:@selector(save)
				 forControlEvents:UIControlEventTouchUpInside];
		
		UIBarButtonItem *okButton = [[UIBarButtonItem alloc] 
									 initWithCustomView:blueSaveButton];
		self.title = @"Set Difficulty";
		[self.navigationItem setRightBarButtonItem:okButton];
		[okButton release];
		[blueSaveButton release];
		
	}
	return self;
}

#pragma mark -
#pragma mark Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	NSLog(@"calling number of sections");
	return 1;
}
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return [cells count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellID = @"Cell ID";
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];	
	NSString *curr = [cells objectAtIndex:indexPath.row];
	cell.textLabel.text = curr;
	cell.accessoryType = UITableViewCellAccessoryNone;
	if ([current isEqualToString:curr])
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	cell.imageView.image = [UIImage imageNamed:[curr stringByAppendingString:@"Image.png"]];
	[cellID release];
	[curr release];
	return cell;
}
#pragma mark -
#pragma mark Delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
	current = newCell.textLabel.text;
	[tableView reloadData];
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


- (void)dealloc {
    [super dealloc];
}

-(void)save {
	PlistIO *plist = [[PlistIO alloc] initWithPlistNamed:@"SettingsMenu"];
	[plist updateValue:current atIndex:[plist getIndexWithLabel:@"Turret Color"] forKey:@"Value"];
	[plist release];
	[self.navigationController popViewControllerAnimated:YES];
}

@end
