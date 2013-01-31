//
//  ViewController.h
//  BrowserTabViewDemo
//


#import <UIKit/UIKit.h>
#import "BrowserTabView.h"

@interface ViewController : UIViewController<BrowserTabViewDelegate,UIWebViewDelegate>
{
    BrowserTabView  *tabController;
    UIWebView  *webview;
    NSMutableArray *webviewList;
}
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (nonatomic,retain)UITextView *textView;
@property (nonatomic,retain)NSURLRequest *request;
@property (nonatomic,retain)UIButton *backBtn;
@property (nonatomic,retain)UIButton *forwardBtn;
@property (nonatomic,retain)NSMutableArray *webviewList;
@end
