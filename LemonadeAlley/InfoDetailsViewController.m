//
//  EventInfoViewController.m
//  LemonadeAlley
//
//  Created by James Wang on 9/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InfoDetailsViewController.h"

@implementation InfoDetailsViewController
@synthesize url;

//- (IBAction)drillDown:(id)sender
//{
//    NSLog(@"Details");
//    PhotoSetViewController *dvc = [[PhotoSetViewController alloc] init];
//    dvc.title = @"Details";
//    
//    [self.navigationController pushViewController:dvc animated:YES];
//    [dvc release];
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

- (void)viewWillAppear:(BOOL)animated {
	// to fix the controller showing under the status bar
	self.view.frame = [[UIScreen mainScreen] applicationFrame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    NSString *urlAddress = @"http://www.google.com";
//    NSURL *url = [NSURL URLWithString:urlAddress];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [webView release];
    webView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}
@end
