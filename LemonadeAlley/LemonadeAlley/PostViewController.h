//
//  DetailViewController.h
//  LemonadeAlley
//
//  Created by Jian Shi Wang on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSDictionary *post;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
