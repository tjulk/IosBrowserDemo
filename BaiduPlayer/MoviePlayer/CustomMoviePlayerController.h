

#import <UIKit/UIKit.h>
#import <MediaPlayer/MPVolumeView.h>
#import <MediaPlayer/MPMusicPlayerController.h>
#import "CustomPlayerView.h"
#import "MBProgressHUD.h"

@interface CustomMoviePlayerController : UIViewController<UIPopoverControllerDelegate>{
    IBOutlet CustomPlayerView *moviePlayeView;
    IBOutlet UIButton *playButton;
    IBOutlet UISlider *movieProgressSlider;
    //视频的总时间
    CGFloat totalMovieDuration;
    IBOutlet UILabel *currentTimeLabel;
    IBOutlet UILabel *totalTimeLabel;
    MBProgressHUD *loadingView;
    IBOutlet UISlider *voicechanger;
}
@property(nonatomic) NSURL *movieURL;
-(IBAction)doneClick:(id)sender;
-(IBAction)playClick:(id)sender;
-(IBAction)movieProgressDragged:(id)sender;
- (IBAction)onVoiceValueChanged:(UISlider *)sender;
@end
