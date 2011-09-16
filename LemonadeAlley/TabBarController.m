#import "TabBarController.h"

@implementation TabBarController

- (void)viewDidLoad {
  [self setTabURLs:[NSArray arrayWithObjects:@"tt://wp",                
                                             @"tt://menu/2",
                                             @"tt://menu/3",
                                             @"tt://menu/4",
                                             @"tt://menu/5",
                                             nil]];
}

@end
