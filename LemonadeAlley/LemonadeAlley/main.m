//
//  main.m
//  LemonadeAlley
//
//  Created by Jian Shi Wang on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[]) {
  [NSThread sleepForTimeInterval:3];
  @autoreleasepool {
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
