//
//  VotingViewController.h
//  LemonadeAlley
//
//  Created by Jian Shi Wang on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "ContestantsInfoAgent.h"
#import "FacebookViewController.h"

@interface VotingViewController : UITableViewController

@property (strong, nonatomic) ContestantsInfoAgent *contestantsInfoAgent;
@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) NSMutableArray *arrayOfSections;

@end
