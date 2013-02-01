//
//  ViewController.m
//  BrowserTabViewDemo
//

#import "ViewController.h"
#import "CustomMoviePlayerController.h"
@implementation ViewController
@synthesize label;
@synthesize textView;
@synthesize request;
@synthesize backBtn;
@synthesize forwardBtn;
@synthesize webviewList;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tabController= [[BrowserTabView alloc] initWithTabTitles:[NSArray arrayWithObjects:@"百度影音", nil]
                                                 andDelegate:self];
    tabController.delegate = self;
    
    //tab
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setImage:[UIImage imageNamed:@"tab_new_add.png"] forState:
     UIControlStateNormal];
    
    [addButton addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    addButton.frame = CGRectMake(1024-40, 5, 27 , 27);
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:tabController];
    [self.view addSubview:addButton];
    
    //url input
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, 800, 40)];
    self.textView.backgroundColor = [UIColor grayColor];
    self.textView.scrollEnabled = NO;
    
    self.textView.font = [UIFont fontWithName:@"Arial"size:22.0];//设置字体名字和字体大小
    
    self.textView.backgroundColor= [UIColor whiteColor];//设置它的背景颜色 
    
    [self.view addSubview:textView];
    
    //search button
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search_bar_change_searchtype_button_bg_highlighted@2x.png"] forState:UIControlStateNormal];
    [searchBtn setBackgroundColor:[UIColor whiteColor]];
    [searchBtn setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    
    [searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
     [searchBtn setTitle:@"訪問" forState:UIControlStateNormal];  
    
    searchBtn.frame = CGRectMake(805, 50, 50 , 40);
    
    [self.view addSubview:searchBtn];
    
    //back button
    backBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"webtoolbar_back_normal.png"] forState:UIControlStateNormal];
    [backBtn setBackgroundColor:[UIColor whiteColor]];
    [backBtn setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    backBtn.frame = CGRectMake(870, 50, 50 , 40);
    
    [self.view addSubview:backBtn];
    
    //forward button
    forwardBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [forwardBtn setBackgroundImage:[UIImage imageNamed:@"webtoolbar_forward_normal.png"] forState:UIControlStateNormal];
    [forwardBtn setBackgroundColor:[UIColor whiteColor]];
    [forwardBtn setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    
    [forwardBtn addTarget:self action:@selector(forward:) forControlEvents:UIControlEventTouchUpInside];
    
    forwardBtn.frame = CGRectMake(935, 50, 50 , 40);
    
    [self.view addSubview:forwardBtn];
    
    
    webviewList = [[NSMutableArray alloc] initWithCapacity:10];
    
    UIWebView *newWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, 1024 , 768)]; 
    [webviewList addObject:newWebView];
    
    
    webview = newWebView;
    webview.delegate = self;

    NSURLRequest *newrequest =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.pptv.com"]]; 
    [newWebView loadRequest:newrequest]; 
    
    [self.view addSubview:newWebView];

}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [super viewDidUnload];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}
-(void)add:(id)sender
{

    
    UIWebView *newWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, 1024 , 768)]; 

    
    
    NSURLRequest *addrequest =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]; 
    [newWebView loadRequest:addrequest]; 
    
    [self.view addSubview:newWebView];
    
    
    [webviewList addObject:newWebView];
    
    webview = newWebView;
    webview.delegate = self;
    
    
    //新增頁面
    [tabController addTabWithTitle:nil];
}

-(void)search:(id)sender
{
    [textView resignFirstResponder];
    //visite url
    request =[NSURLRequest requestWithURL:[NSURL URLWithString:textView.text]]; 
    [webview loadRequest:request];
}

-(void)back:(id)sender
{
    [webview goBack];
}

-(void)forward:(id)sender
{
    [webview goForward];
}


#pragma mark -
#pragma mark BrowserTabViewDelegate
-(void)BrowserTabView:(BrowserTabView *)browserTabView didSelecedAtIndex:(NSUInteger)index
{
    NSLog(@"tabview index:========%d + %d",index,[webviewList count]);

    UIWebView *selectView = [webviewList objectAtIndex:index];
    
    [self.view addSubview:selectView];
    
    webview = selectView;
    webview.delegate = self;
    
    [self updateToolbarItems];
    
    
}

-(void)BrowserTabView:(BrowserTabView *)browserTabView didRemoveTabAtIndex:(NSUInteger)index{
    NSLog(@"刪除頁面:  %d",index);
}
-(void)BrowserTabView:(BrowserTabView *)browserTabView exchangeTabAtIndex:(NSUInteger)fromIndex withTabAtIndex:(NSUInteger)toIndex{

 NSLog(@"BrowserTabView exchange Tab  at index:  %d with Tab at index :%d ",fromIndex,toIndex);
}


- (void)dealloc {
    [label release];
    [super dealloc];
}



#pragma mark -
#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self updateToolbarItems];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [self updateToolbarItems];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self updateToolbarItems];
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)jqrequest navigationType:(UIWebViewNavigationType)navigationType{
    NSString *str=[NSString stringWithFormat:@"%@",jqrequest.URL];
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
//刷新前進後退按鈕
- (void)updateToolbarItems {
    self.backBtn.enabled = webview.canGoBack;
    self.forwardBtn.enabled = webview.canGoForward;
    self.textView.text = webview.request.URL.absoluteString;
}




@end
