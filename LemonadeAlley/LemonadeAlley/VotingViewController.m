#import "VotingViewController.h"


@implementation VotingViewController
@synthesize HUD;
@synthesize contestantsInfoAgent;
@synthesize arrayOfSections;

- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
  }
  return self;
}

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  arrayOfSections = [[NSMutableArray alloc] init];
  [arrayOfSections addObject:[NSString stringWithFormat:@"Grades 10-12"]];
  [arrayOfSections addObject:[NSString stringWithFormat:@"Grades 7-9"]];
  [arrayOfSections addObject:[NSString stringWithFormat:@"Grades 3-6"]];
  [arrayOfSections addObject:[NSString stringWithFormat:@"Grades K-2"]];
  self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lemon_200x200.png"]];
  contestantsInfoAgent = [[ContestantsInfoAgent alloc] init];
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
  HUD.labelText = @"Loading";
  //  HUD.userInteractionEnabled = NO;
  [self.navigationController.view addSubview:HUD];
  [HUD show:YES];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(receiveDataNotification:) 
                                               name:@"ContestantInfoUpdateNotification"
                                             object:nil];
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return [arrayOfSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  if (section == 0) {
    return [[contestantsInfoAgent contestants10] count];
  }
  else if (section == 1) {
    return [[contestantsInfoAgent contestants7] count];
  }
  else if (section == 2) {
    return [[contestantsInfoAgent contestants3] count];
  }
  else if (section == 3) {
    return [[contestantsInfoAgent contestantsK] count];
  }
  else {
    return 0;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
  }
  NSUInteger row = [indexPath row];
  NSDictionary *contestantsInfo = nil;
  
  if (indexPath.section == 0) {
   contestantsInfo = [[contestantsInfoAgent contestants10] objectAtIndex:row];
  }
  else if (indexPath.section == 1) {
    contestantsInfo = [[contestantsInfoAgent contestants7] objectAtIndex:row];
  }
  else if (indexPath.section == 2) {
    contestantsInfo = [[contestantsInfoAgent contestants3] objectAtIndex:row];
  }
  else if (indexPath.section == 3) {
    contestantsInfo = [[contestantsInfoAgent contestantsK] objectAtIndex:row];
  }
  

  NSLog(@"Page: %@", contestantsInfo);
  // Configure the cell...
  cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
  cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
  //  cell.textLabel.textColor = [UIColor whiteColor];
  cell.textLabel.text = [contestantsInfo objectForKey:@"team name"];
  cell.textLabel.backgroundColor = [UIColor clearColor];
  //  cell.detailTextLabel.font = [UIFont fontWithName:@"Noteworthy-Light" size:14.0];
//  cell.detailTextLabel.text = [NSString stringWithFormat:@"Grade: %@", [contestantsInfo objectForKey:@"grade division"]];
  return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return [[self arrayOfSections] objectAtIndex:section];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here. Create and push another view controller.
  /*
   DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"Nib name" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   */
}

- (void) receiveDataNotification:(NSNotification *) notification {
  if ([[notification name] isEqualToString:@"ContestantInfoUpdateNotification"]) {
    NSLog (@"Successfully received the ContestantInfoUpdateNotification!");
    [[self tableView] reloadData];
    [HUD hide:YES];
  }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  NSLog(@"Segue identifier: %@", segue.identifier);
  
  if ([[segue identifier] isEqualToString:@"showContestantInfo"]) {
    NSLog(@"ShowDetails from prepareforsegue (Voting)");
    NSInteger row = [[self.tableView indexPathForSelectedRow] row];
    NSDictionary *contestantInfo = [contestantsInfoAgent.contestantsInfos objectAtIndex:row];
    
    // [segue destinationViewController] is read-only, so in order to
    // write to that view controller you'll have to locally instantiate
    // it here:
    FacebookViewController *facebookViewController = [segue destinationViewController];
    facebookViewController.contestantInfo = contestantInfo;
    
    // You now have a solid reference to the upcoming / destination view
    // controller. Example use: Allocate and initialize some property of
    // the destination view controller before you reach it and inject a
    // reference to the current view controller into the upcoming one:
    //    upcomingViewController.someProperty = [[SomePropertyClass alloc] initWithString:@"Whatever!"];
    //    upcomingViewController. = [segue sourceViewController];
    
    // Or, equivalent, but more straightforward:
    //upcomingViewController.initialViewController = self;
  }
}
@end