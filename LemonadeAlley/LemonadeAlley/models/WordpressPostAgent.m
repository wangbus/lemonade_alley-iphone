//
//  WPPost.m
//  LemonadeAlley
//
//  Created by Jian Shi Wang on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "WordpressPostAgent.h"

@implementation WordpressPostAgent

@synthesize responseData;
@synthesize response;
@synthesize posts;

- (id) init {
  self = [super init];
  if (self != nil) {
    // Create the request.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://lemonadealley.com/api/get_recent_posts/"]
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:60.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connection) {
      self.responseData = [NSMutableData data];
    }
    else {
      // Inform the user that the connection failed.
    }
  }
  return self;
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
  
  // sethostname (array of dictionaries)
  posts = [response objectForKey:@"posts"];
  
  // dictionary (array element)
  //  for (NSDictionary *post in posts) {
  //    NSString *content = [post objectForKey:@"content"];
  //    NSLog(@"%@", content);
  //  }
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"NewsUpdateNotification" object:self];
}

@end