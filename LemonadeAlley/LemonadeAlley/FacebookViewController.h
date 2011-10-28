//
//  FacebookViewController.h
//  LemonadeAlley
//
//  Created by James Wang on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FacebookViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) NSDictionary *contestantInfo;

@end
