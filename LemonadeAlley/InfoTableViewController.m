//
//  InfoTableViewController.m
//  LemonadeAlley
//
//  Created by James Wang on 9/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InfoTableViewController.h"
#import "InfoDetailsViewController.h"
//#import "WordPressBlogViewController.h"

@implementation InfoTableViewController
@synthesize topics;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.topics = [NSArray 
                   arrayWithObjects: @"About", @"Compete", @"Craft Fair", @"Sponsorship", @"Contact", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"loaded table");
    
    self.navigationController.title = @"Testing";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
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
	// Number of sections is the number of regions.
    //	return regions count];
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Number of rows is the number of time zones in the region for the specified section.
    //	Region *region = [regions objectAtIndex:section];
    //	return [region.timeZoneWrappers count];
    return [self.topics count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// The header for the section is the region name -- get this from the region at the section index.
    //	Region *region = [regions objectAtIndex:section];
    //	return [region name];
    return [self.topics objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
	}
	
	// Get the section index, and so the region for that section.
    //	Region *region = [regions objectAtIndex:indexPath.section];
    //	TimeZoneWrapper *timeZoneWrapper = [region.timeZoneWrappers objectAtIndex:indexPath.row];
    //	
	// Set the cell's text to the name of the time zone at the row
    //	cell.textLabel.text = timeZoneWrapper.localeName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [self.topics objectAtIndex:[indexPath row]];
    return cell;
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
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.textLabel.text;
    NSURL *url;
    if ([cellText isEqualToString:@"About"]) {
        url = [NSURL URLWithString:@"http://lemonadealley.com/about/"];
//        url = [NSURL URLWithString:@"http://hicapacity.org/resources/"];
    }
    else if ([cellText isEqualToString:@"Compete"]) {
        url = [NSURL URLWithString:@"http://lemonadealley.com/competition/"];
    }
    else if ([cellText isEqualToString:@"Craft Fair"]) {
        url = [NSURL URLWithString:@"http://lemonadealley.com/craft-fair/"];
    }
    else if ([cellText isEqualToString:@"Sponsorship"]) {
        url = [NSURL URLWithString:@"http://lemonadealley.com/sponsors/"];
    }
    else if ([cellText isEqualToString:@"Contact"]) {
        url = [NSURL URLWithString:@"http://lemonadealley.com/contact/"];
    }

    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    InfoDetailsViewController *detailsViewController = [[InfoDetailsViewController alloc] init];
//    WordPressBlogViewController *detailsViewController = [[WordPressBlogViewController alloc] init];
//    detailViewController.url = url;
    
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

@end
