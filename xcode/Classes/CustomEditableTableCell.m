#import "CustomEditableTableCell.h"


@implementation CustomEditableTableCell

@synthesize textLabel, rightTextField, errorAlert;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

//    [super setSelected:selected animated:animated];
	NSLog(@"set selected from custom editable.");
	// Configure the view for the selected state
}

- (void)dealloc {
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	if ([theTextField.text length] != 0) {
		[theTextField resignFirstResponder];
		[self save];
		return YES;
	} else {
		errorAlert = [[[UIAlertView alloc] initWithTitle:@"\n\nPlease fill out your name!\n\n" 
											message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil] autorelease];
		
		[errorAlert show];
		[NSTimer scheduledTimerWithTimeInterval: 2.0 target:self selector:@selector(dismissAnAlert) userInfo:nil repeats:YES];
	}
	return NO;
}
-(void)dismissAnAlert
{
	if (errorAlert != nil) {
		[errorAlert dismissWithClickedButtonIndex:0 animated:YES];
		errorAlert = nil;
		[errorAlert release];
	}
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	NSArray *allTouches = [touches allObjects];
	for (UITouch *touch in allTouches) {
		if ([touch.view isKindOfClass:[UITextField class]])
			[touch.view resignFirstResponder];
	}
}

-(IBAction)stopEditing:(id)sender {
	[self textFieldShouldReturn:rightTextField];
}

-(void)save
{
	PlistIO *plist = [[PlistIO alloc] initWithPlistNamed:@"SettingsMenu"];
	[plist updateValue:rightTextField.text atIndex:[plist getIndexWithLabel:@"Your Name"] forKey:@"Value"];
	[plist release];
}
@end
