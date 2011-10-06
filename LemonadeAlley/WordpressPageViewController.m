//
//  WordpressPageViewController.m
//  LemonadeAlley
//
//  Created by James Wang on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WordpressPageViewController.h"

@implementation WordpressPageViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
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

- (void)viewDidLoad {
  [super viewDidLoad];
  NSString *urlAddress = @"http://lemonadealley.com/about";
  NSURL *url = [NSURL URLWithString:urlAddress];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  [self.webView loadRequest:request];
  
  // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
  [self setWebView:nil];
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
