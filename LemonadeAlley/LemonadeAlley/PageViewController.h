#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface PageViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic, strong) NSDictionary *page;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSDictionary *response;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) MBProgressHUD *HUD;

@end
