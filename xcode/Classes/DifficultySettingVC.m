    //
//  DifficultySettingVC.m
//  SelectScreen
//
//  Created by Colin Young on 5/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "DifficultySettingVC.h"


@implementation DifficultySettingVC

@synthesize slider, label, difficulties, sliderValue;

-(void)setInitialSliderValue:(NSString *)val
{
	label.text = val;
	int d = 1;
	if ([label.text isEqualToString:@"Easy"]) d = 1;
	if ([label.text isEqualToString:@"Medium"]) d = 2;	
	if ([label.text isEqualToString:@"Hard"]) d = 3;
	slider.value = d
	;
	sliderValue = slider.value;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		NSDictionary *tmp = [NSDictionary dictionaryWithObjectsAndKeys:
							 [NSNumber numberWithInt:1],@"Easy",
							 [NSNumber numberWithInt:2],@"Medium",
							 [NSNumber numberWithInt:3],@"Hard",
							 nil];
		
		self.difficulties = tmp;
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

-(IBAction)sliderValueChanged:(id)sender {
	int n = (int) round(slider.value);
	if (n != sliderValue) {
		NSNumber *b = [NSNumber numberWithInt:n];
		NSLog(@"slider val chngs to %d", n);
		NSString *tmp = [[self.difficulties allKeysForObject:b] objectAtIndex:0];
		NSLog(@"%@", tmp);
		
		label.text = tmp;
		[tmp release];
		[b release];
		sliderValue = n;		
		NSLog(@"slider value changed");
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void)save {
	int n = (int) round(slider.value);
	NSNumber *b = [NSNumber numberWithInt:n];
	NSString *value = @"";
	PlistIO *plist = [[PlistIO alloc] initWithPlistNamed:@"SettingsMenu"];
	switch ([b intValue]) {
		case 1:
			value = @"Easy";
			break;
		case 2:
			value = @"Medium";
			break;
		case 3:
			value = @"Hard";
			break;
		default:
			value = @"Easy";
			break;
	}
	[plist updateValue:value atIndex:[plist getIndexWithLabel:@"Game Difficulty"] forKey:@"Value"];
	[plist release];

	[b release];
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
	[slider release];
	[label release];
	[difficulties release];
    [super dealloc];
}


@end
