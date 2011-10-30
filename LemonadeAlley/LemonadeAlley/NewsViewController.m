#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

#import "NewsViewController.h"
#import "WordpressPostAgent.h"
#import "PostViewController.h"

@implementation NewsViewController
@synthesize wordpressPostAgent;
@synthesize HUD;

- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
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
  self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lemon_200x200.png"]];
  self.parentViewController.title  = @"News";
  wordpressPostAgent = [[WordpressPostAgent alloc] init];
  HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
  HUD.labelText = @"Loading";
  //  HUD.userInteractionEnabled = NO;
  [self.navigationController.view addSubview:HUD];
  [HUD show:YES];
  
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(receiveDataNotification:) 
                                               name:@"NewsUpdateNotification"
                                             object:nil];
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[wordpressPostAgent posts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
  }
  //  cell.backgroundColor = [UIColor clearColor];
  //  cell.textLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:16.0];
  //  cell.textLabel.textColor = [UIColor whiteColor];
  
  cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
  cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
  
  NSUInteger row = [indexPath row];
  NSDictionary *post = [[wordpressPostAgent posts] objectAtIndex:row];
  
  // Configure the cell...
  cell.textLabel.text = [post objectForKey:@"title"];
  
  cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
  cell.textLabel.numberOfLines = 0;
  cell.textLabel.backgroundColor = [UIColor clearColor];
//  cell.detailTextLabel.text = 
  
  NSString *modified = [post objectForKey:@"modified"];
  NSDateFormatter *dateFormatterFromWordpress = [[NSDateFormatter alloc] init];
  [dateFormatterFromWordpress setDateFormat:@"yyyy-MM-dd HH:mm:ss"];    
  NSDate *date = [dateFormatterFromWordpress dateFromString:modified];
  
  NSLocale *locale = [NSLocale currentLocale];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; 
  NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"E MMM d yyyy HH:mm" options:0 locale:locale];
  [dateFormatter setDateFormat:dateFormat];
  [dateFormatter setLocale:locale];
  
  NSString *modifiedFormatted = [dateFormatter stringFromDate: date];
  cell.detailTextLabel.text = [NSString stringWithFormat:@"Posted: %@", modifiedFormatted];
  
  cell.detailTextLabel.backgroundColor = [UIColor clearColor];
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *post = [[wordpressPostAgent posts] objectAtIndex:[indexPath row]];
  NSString *text = [post objectForKey:@"title"];
  CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
  CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
  CGFloat height = MAX(size.height, 44.0f);
  return height + (CELL_CONTENT_MARGIN * 2);
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Navigation logic may go here. Create and push another view controller.
  /*
   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   */
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  if (section == 0) {
    return @"Blog";
  }
  else {
    return @"";
  }
}

- (void) receiveDataNotification:(NSNotification *) notification {
  if ([[notification name] isEqualToString:@"NewsUpdateNotification"]) {
    NSLog (@"Successfully received the Data Update notification!");
    [[self tableView] reloadData];
    [HUD hide:YES];
  }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  NSLog(@"prepareForSegue");
  NSLog(@"%@", segue.identifier);
  
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
    NSLog(@"ShowDetails from prepareforsegue");
    NSInteger row = [[self.tableView indexPathForSelectedRow] row];
    NSDictionary *post = [wordpressPostAgent.posts objectAtIndex:row];
    
    // [segue destinationViewController] is read-only, so in order to
    // write to that view controller you'll have to locally instantiate
    // it here:
    PostViewController *detailViewController = [segue destinationViewController];
    detailViewController.post = post;
    
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
