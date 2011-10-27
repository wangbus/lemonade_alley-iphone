//
//  WordpressPageAgent.h
//  LemonadeAlley
//
//  Created by James Wang on 10/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordpressPageAgent : NSObject <NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSDictionary *response;
@property (strong, nonatomic) NSArray *pages;

@end
