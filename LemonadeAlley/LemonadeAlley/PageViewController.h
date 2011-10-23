#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic, strong) NSDictionary *page;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSDictionary *response;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
