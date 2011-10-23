//
//  WPPost.h
//  LemonadeAlley
//
//  Created by Jian Shi Wang on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordpressPostAgent : NSObject <NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSDictionary *response;
@property (strong, nonatomic) NSArray *posts;

@end
