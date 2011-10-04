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
  [self setTabURLs:[NSArray arrayWithObjects:@"tt://wp",                
                    @"tt://menu/2",
                    @"tt://menu/3",
                    @"tt://menu/4",
                    @"tt://menu/5",
                    nil]];
}

@end