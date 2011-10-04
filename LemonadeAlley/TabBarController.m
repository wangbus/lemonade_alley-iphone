//
//  TabBarController.m
//  LemonadeAlley
//
//  Created by James Wang on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TabBarController.h"

@implementation TabBarController

- (void)viewDidLoad {
  [self setTabURLs:[NSArray arrayWithObjects:@"tt://blog",
                    @"tt://about",
                    nil]];
}

@end