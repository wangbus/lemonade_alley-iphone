//
//  LemonadeAlleyAppDelegate.m
//  LemonadeAlley
//
//  Created by James Wang on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Three20/Three20.h"
#import "LemonadeAlleyAppDelegate.h"
#import "WPTabBarController.h"
#import "WordPressBlogViewController.h"
#import "WordPressAddCommentViewController.h"
#import "TabBarController.h"
#import "MenuController.h"
#import "ContentController.h"
@implementation LemonadeAlleyAppDelegate

//@synthesize window = _window;
//@synthesize tabBarController = _tabBarController;
//@synthesize splashScreen;

- (void)applicationDidFinishLaunching:(UIApplication*)application {
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
//    self.window.rootViewController = self.tabBarController;
//    [self.window addSubview:self.tabBarController.view];
    
//    self.splashScreen.showsStatusBarOnDismissal = YES;
//    self.splashScreen.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

//    self.tabBarController.delegate = self;
//    [self.tabBarController presentModalViewController:splashScreen animated:NO];
    
    
    TTNavigator* navigator = [TTNavigator navigator];
    navigator.persistenceMode = TTNavigatorPersistenceModeAll;
    navigator.window = [[[UIWindow alloc] initWithFrame:TTScreenBounds()] autorelease];
    
	TTURLMap* map = navigator.URLMap;
	

    [map from:@"*" toViewController:[TTWebController class]];
    [map from:@"tt://tabBar" toSharedViewController:[TabBarController class]];
    [map from:@"tt://wp" toSharedViewController:[WordPressBlogViewController class]];
    [map from:@"tt://menu/(initWithMenu:)" toSharedViewController:[MenuController class]];
    
    [map from:@"tt://food/(initWithFood:)" toViewController:[ContentController class]];
    [map from:@"tt://about/(initWithAbout:)" parent:@"tt://menu/5"
toViewController:[ContentController class] selector:nil transition:0];
    
    [map from:@"tt://food/(initWithNutrition:)/nutrition" toViewController:[ContentController class]
   transition:UIViewAnimationTransitionFlipFromLeft];
    
    // The ordering controller will appear as a modal view controller, animated from bottom to top
    [map from:@"tt://order?waitress=(initWithWaitress:)"
toModalViewController:[ContentController class]];
    
    [map from:@"tt://order?waitress=()#(orderAction:)" toViewController:[ContentController class]];
    
    
    [map from:@"tt://order/food" toViewController:[TTPostController class]];
    
    
    [map from:@"tt://order/confirm" toViewController:self selector:@selector(confirmOrder)];
    
    
    [map from:@"tt://order/send" toObject:self selector:@selector(sendOrder)];


    // Before opening the tab bar, we see if the controller history was persisted the last time
    if (![navigator restoreViewControllers]) {
        // This is the first launch, so we just start with the tab bar
        [navigator openURLAction:[TTURLAction actionWithURLPath:@"tt://tabBar"]];
    }
//    [self.window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)URL {
    [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:URL.absoluteString]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (UIViewController*)confirmOrder {
    TTAlertViewController* alert = [[[TTAlertViewController alloc]
                                     initWithTitle:@"Are you sure?"
                                     message:@"Sure you want to order?"] autorelease];
    [alert addButtonWithTitle:@"Yes" URL:@"tt://order/send"];
    [alert addCancelButtonWithTitle:@"No" URL:nil];
    return alert;
}

- (void)sendOrder {
    TTDINFO(@"SENDING THE ORDER...");
}

- (void)dealloc
{
    [super dealloc];
}
@end
