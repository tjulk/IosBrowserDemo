

#import <UIKit/UIKit.h>
#import "BrowserTab.h"
@class BrowserTabView;
@class BrowserTab;

@protocol BrowserTabViewDelegate<NSObject>

@optional
-(void)BrowserTabView:(BrowserTabView *)browserTabView didSelecedAtIndex:(NSUInteger)index;
-(void)BrowserTabView:(BrowserTabView *)browserTabView willRemoveTabAtIndex:(NSUInteger)index;
-(void)BrowserTabView:(BrowserTabView *)browserTabView didRemoveTabAtIndex:(NSUInteger)index;
-(void)BrowserTabView:(BrowserTabView *)browserTabView exchangeTabAtIndex:(NSUInteger)fromIndex withTabAtIndex:(NSUInteger)toIndex;
@end

@interface BrowserTabView : UIView<UIGestureRecognizerDelegate,UIWebViewDelegate>{
   
    //UIWebView *webview;
    // image for the tabview backgroud
    UIImage *tabViewBackImage;
    
    NSUInteger numberOfTabs;
    
    NSInteger selectedTabIndex;
    
    //array for saving all the tab
    NSMutableArray *tabsArray;
  
    //array for saving  frames of tabs
    NSMutableArray *tabFramesArray;

     // reuse queue holds unused tabs
     NSMutableArray *reuseQueue;                        
    id<BrowserTabViewDelegate> delegate;
    
}

@property(nonatomic, retain) UIImage *tabViewBackImage;
@property(nonatomic, assign) NSUInteger numberOfTabs;
@property(nonatomic, assign) NSInteger selectedTabIndex;
@property(nonatomic, retain) NSMutableArray *tabsArray;
@property(nonatomic, retain) NSMutableArray *tabFramesArray;

@property(nonatomic, readonly) NSMutableArray *reuseQueue;
@property(nonatomic, assign) id<BrowserTabViewDelegate> delegate;

-(id)initWithTabTitles:(NSArray *)titles andDelegate:(id)adelegate;
-(void)addTabWithTitle:(NSString *)title;
-(void)setSelectedTabIndex:(NSInteger)aSelectedTabIndex animated:(BOOL)animation;
-(void)removeTabAtIndex:(NSInteger)index animated:(BOOL)animated;

-(void)updateTabTitle:(NSInteger)index withTitle:(NSString *)tabtitle;

@end
