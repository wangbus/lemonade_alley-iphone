//
//  PagesViewController.h
//  LemonadeAlley
//
//  Created by James Wang on 10/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordpressPageAgent.h"
#import "MBProgressHUD.h"

@interface AboutViewController : UITableViewController

@property (strong, nonatomic) WordpressPageAgent *wordpressPageAgent;
@property (strong, nonatomic) MBProgressHUD *HUD;

@end
