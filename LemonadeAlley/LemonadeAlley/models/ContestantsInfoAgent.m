#import "ContestantsInfoAgent.h"

@implementation ContestantsInfoAgent
@synthesize responseData;
@synthesize response;
@synthesize contestantsInfos;

- (id) init {
  self = [super init];
  if (self != nil) {
    // Create the request.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://wangb.us/la/contestants_info.json"]
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
  NSLog(@"Finished loading: %@", response);
  
  
  contestantsInfos = [response objectForKey:@"contestants"];
  
  // dictionary (array element)
  for (NSDictionary *info in contestantsInfos) {
    NSString *content = [info objectForKey:@"team name"];
    NSLog(@"%@", content);
  }
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"ContestantInfoUpdateNotification" object:self];
}


@end
