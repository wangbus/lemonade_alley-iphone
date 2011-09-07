//
//  LemonadeAlleyAppDelegate.h
//  LemonadeAlley
//
//  Created by James Wang on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashScreenController.h"

@interface LemonadeAlleyAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet SplashScreenController *splashScreen;

@end
