//
//  WordpressPageViewController.h
//  LemonadeAlley
//
//  Created by James Wang on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordpressPageViewController : UIViewController {
  UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
