#import "PageViewController.h"

@implementation PageViewController

@synthesize page;
@synthesize label;
@synthesize responseData;
@synthesize response;
@synthesize webView;
@synthesize HUD;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

- (void)viewDidLoad {
  [super viewDidLoad];
  NSString *url = [page objectForKey:@"url"];
  // Create the request.
  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                       timeoutInterval:60.0];
  NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  if (connection) {
    self.responseData = [NSMutableData data];
  }
  else {
    // Inform the user that the connection failed.
  }
  
  HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
  HUD.labelText = @"Loading";
//  HUD.userInteractionEnabled = NO;
  [self.navigationController.view addSubview:HUD];
  [HUD show:YES];
}


- (void)viewDidUnload {
  [self setLabel:nil];
  [self setWebView:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


// NSURLConnection callbacks
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  NSLog(@"%@", error);  
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  // Once this method is invoked, "responseData" contains the complete result
  //  NSString *res = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
  NSError *error = nil;
  response = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error]; 
//  NSLog(@"Finished loading: %@", response);
  
  NSDictionary *jsonPage = [response objectForKey:@"page"];
  NSString *html = [jsonPage objectForKey:@"content"];
  NSLog(@"HTML: %@", html);
  [webView setBackgroundColor:[UIColor clearColor]];
  
  //pass the string to the webview
  [webView loadHTMLString:[html description] baseURL:nil];
  [webView reload];
  [HUD hide:YES];
  // sethostname (array of dictionaries)
//  posts = [response objectForKey:@"posts"];
  
  // dictionary (array element)
  //  for (NSDictionary *post in posts) {
  //    NSString *content = [post objectForKey:@"content"];
  //    NSLog(@"%@", content);
  //  }
}

@end
