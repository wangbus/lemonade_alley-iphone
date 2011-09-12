//
//  DetailsViewController.h
//  LemonadeAlley
//
//  Created by James Wang on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Three20/Three20.h"
@class PhotoSet;

@interface PhotoSetViewController : TTPhotoViewController {
    PhotoSet *_photoSet;
}

@property (nonatomic, retain) PhotoSet *photoSet;

@end