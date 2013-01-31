

#import "JQWebVideoViewController.h"
#import "CustomMoviePlayerController.h"
@interface JQWebVideoViewController ()

@end

@implementation JQWebVideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url=[NSURL URLWithString:@"http://m.pptv.com/"];
    NSURLRequest *r=[NSURLRequest requestWithURL:url];
    [mWebView loadRequest:r];
    [mWebView setDelegate:self];
    mWebView.mediaPlaybackAllowsAirPlay=NO;
    mWebView.allowsInlineMediaPlayback=NO;
    
}

- (void)viewDidUnload
{
    mWebView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"did started %@",[webView request].URL);

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

    NSLog(@"did finished %@",[webView request].URL);
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
        NSString *str=[NSString stringWithFormat:@"%@",request.URL];
        NSRange rang=[str rangeOfString:@"mp4?"];
    if (rang.location!=NSNotFound) {
           NSURL *linkURL = [NSURL URLWithString:str];
           CustomMoviePlayerController *movieController = [[CustomMoviePlayerController alloc]init];
           movieController.movieURL = linkURL;
           [self presentModalViewController:movieController animated:YES];
        return  false;
    }
        return true;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}
@end
