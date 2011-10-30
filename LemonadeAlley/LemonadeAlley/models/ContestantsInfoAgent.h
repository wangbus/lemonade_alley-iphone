//
//  ContestantsInfoAgent.h
//  LemonadeAlley
//
//  Created by Jian Shi Wang on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContestantsInfoAgent : NSObject <NSURLConnectionDelegate>

@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSDictionary *response;
@property (strong, nonatomic) NSArray *contestantsInfos;

@property (strong, nonatomic) NSMutableArray *contestants10;
@property (strong, nonatomic) NSMutableArray *contestants7;
@property (strong, nonatomic) NSMutableArray *contestants3;
@property (strong, nonatomic) NSMutableArray *contestantsK;


@end
