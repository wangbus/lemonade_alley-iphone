//
//  EventInfoViewController.h
//  LemonadeAlley
//
//  Created by James Wang on 9/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoSetViewController.h"

@interface InfoDetailsViewController : UIViewController {
    IBOutlet UIWebView *webView;
}

@property (nonatomic, assign) NSURL *url;

@end
