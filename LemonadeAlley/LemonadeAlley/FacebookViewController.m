//
//  FacebookViewController.m
//  LemonadeAlley
//
//  Created by James Wang on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FacebookViewController.h"

@implementation FacebookViewController
@synthesize webView;
@synthesize contestantInfo;

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

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  NSString *urlAddress = [self.contestantInfo objectForKey:@"facebook url"];
  
  if ([urlAddress isEqualToString:@"-"]) {
    [webView loadHTMLString:@"No Facebook page found." baseURL:nil];
    [webView setOpaque:NO];
    [webView setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.3]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lemon_200x200.png"]];
  }
  else {
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];
    [webView setOpaque:NO];
    //pass the string to the webview
  }
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

@end
