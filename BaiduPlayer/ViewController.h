//
//  ViewController.h
//  BrowserTabViewDemo
//


#import <UIKit/UIKit.h>
#import "BrowserTabView.h"
#import "IMTWebView.h"
#import "ChromeProgressBar.h"


@interface ViewController : UIViewController<BrowserTabViewDelegate,UIWebViewDelegate,IMTWebViewProgressDelegate>
{
    BrowserTabView  *tabController;
    //IMTWebView  *webview;
    NSMutableArray *webviewList;
    ChromeProgressBar *chromeBar;
}
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (nonatomic,retain)UITextView *textView;
@property (nonatomic,retain)NSURLRequest *request;
@property (nonatomic,retain)UIButton *backBtn;
@property (nonatomic,retain)UIButton *forwardBtn;
@property (nonatomic,retain)UIButton *reflashAndClosed;

@property (nonatomic,retain)NSMutableArray *webviewList;

@property (retain, retain) IMTWebView  *webview;
@end
