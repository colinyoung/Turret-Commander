#import "NameSettingVC.h"


@implementation NameSettingVC

@synthesize textfield, dict;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSBundle* bundle = [NSBundle mainBundle];
	NSString* plistPath = [bundle pathForResource:@"SettingsMenu" ofType:@"plist"];
	
	NSArray* tmp = [[NSArray alloc] initWithContentsOfFile:plistPath];
	NSDictionary* tmpDict = [tmp objectAtIndex:SETTINGS_INDEX_FOR_VC];
	
	self.dict = tmpDict;
	
	textfield.text = [self.dict valueForKey:@"Value"];
	[textfield becomeFirstResponder];
    [super viewDidLoad];
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
	[textfield release];
    [super dealloc];
}
-(IBAction)doneEditing:(id)sender {
	NSLog(@"%@", textfield.text);
	[sender resignFirstResponder];
}
@end
