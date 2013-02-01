
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class UIProgressView;

@interface ChromeProgressBar : UIProgressView {
	UIColor *_tintColor;
    NSTimer *_animationTimer;
}


- (ChromeProgressBar *)initWithFrame:(CGRect)frame;

- (void)setProgress:(CGFloat)value animated:(BOOL)animated;

@end

