#import "MainMenuVC.h"


@implementation MainMenuVC

@synthesize menuItems, menuImages, tableView;

-(void)viewDidLoad
{
	// menu items
	NSArray *tmpA = [[NSArray alloc]initWithObjects:
					 @"Start Game",
					 @"Instructions",
					 @"High Scores",
					 nil];
	self.menuItems = tmpA;
	
	//[tmpA release];
	
	
	// nav controller title
	self.title = @"Main Menu";
	UIImage *img = [UIImage imageNamed:@"MainMenuTitleView.png"];
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:img];
	
}

- (void)dealloc {
	[menuItems release];
	[menuImages release];
	[tableView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	//NSLog(@"calling number of sections");	
	return 1;	
}
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	//NSLog(@"calling number of rows in section %d", section);
	return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellID = @"Cell ID";
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.textColor = [UIColor colorWithWhite:0.0 alpha:1.0];

	
	// image name
	NSString *imageName = [[menuItems objectAtIndex:indexPath.row] stringByAppendingString: @".png"];
	imageName = [imageName stringByReplacingOccurrencesOfString:@" " withString:@""];
	
	cell.imageView.image = [UIImage imageNamed:imageName];
	cell.textLabel.text = [menuItems objectAtIndex:indexPath.row];
	return cell;
}

#pragma mark  -
#pragma mark Cell selection methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.row) {
		case 0:
			// startGame
			[self startGame];
			break;
		case 1:
			[self show:@"Instructions"];
			break;
		case 2:
			[self show:@"HighScores"];
			break;
		default:
			break;
	}
}

-(void)startGame {
	GameVC *newVC = [[GameVC alloc] initWithNibName:@"Game" bundle:nil];
	[self.navigationController pushViewController:newVC animated:YES];
	//play startup sound
	/*[self.navigationController setNavigationBarHidden:YES animated:YES]; 	
	[self.navigationController setToolbarHidden:YES animated:YES]; */
	[newVC release];
}
-(void)show:(NSString *)nibToLoad
{
	UIViewController *newVC = [[UIViewController alloc] initWithNibName:nibToLoad bundle:nil];
	if ([nibToLoad isEqualToString:@"HighScores"]) {
		newVC = (HighScoresVC *) [[HighScoresVC alloc] initWithNibName:nibToLoad bundle:nil];
	}
	if ([nibToLoad isEqualToString:@"Instructions"]) {
		newVC = (Instructions *) [[Instructions alloc] initWithNibName:nibToLoad bundle:nil];
	}	
 	[self.navigationController pushViewController:newVC animated:YES];
	[newVC release];
}
-(void)viewWillAppear:(BOOL)animated 
{
	NSIndexPath*	selection = [self.tableView indexPathForSelectedRow];
	if (selection)
		[self.tableView deselectRowAtIndexPath:selection animated:YES];
	
	[self.tableView reloadData];
	
	self.navigationController.navigationBar.tintColor = [UIColor blackColor];
	//[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:YES];
}
@end

