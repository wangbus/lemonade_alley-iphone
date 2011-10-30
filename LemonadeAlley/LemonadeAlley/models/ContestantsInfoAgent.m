#import "ContestantsInfoAgent.h"

@implementation ContestantsInfoAgent
@synthesize responseData;
@synthesize response;
@synthesize contestantsInfos;
@synthesize contestants10;
@synthesize contestants7;
@synthesize contestants3;
@synthesize contestantsK;

- (id) init {
  self = [super init];
  if (self != nil) {
    contestants10 = [[NSMutableArray alloc] init];
    contestants7 = [[NSMutableArray alloc] init];
    contestants3 = [[NSMutableArray alloc] init];
    contestantsK = [[NSMutableArray alloc] init];
    // Create the request.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://wangb.us/la/contestants_info.json"]
                                             cachePolicy:NSURLRequestReloadIgnoringCacheData
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
    
    NSString *division = [info objectForKey:@"grade division"];
    if ([division isEqualToString:@"10"]) {
      [contestants10 addObject:info];
    }
    else if ([division isEqualToString:@"7"]) {
      [contestants7 addObject:info];
    }
    else if ([division isEqualToString:@"3"]) {
      [contestants3 addObject:info];
    }
    else if ([division isEqualToString:@"k"]) {
      [contestantsK addObject:info];
    }
  }
  [[NSNotificationCenter defaultCenter] postNotificationName:@"ContestantInfoUpdateNotification" object:self];
}


@end
