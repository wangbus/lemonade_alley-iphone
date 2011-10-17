//
//  NewsViewController.h
//  LemonadeAlley
//
//  Created by Jian Shi Wang on 10/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordpressAgent.h"
#import "MBProgressHUD.h"

@interface NewsViewController : UITableViewController

@property (strong, nonatomic) WordpressAgent *wordpressAgent;
@property (strong, nonatomic) MBProgressHUD *HUD;

@end
