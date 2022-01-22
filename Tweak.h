#import <UIKit/UIKit.h>

@interface SPTNowPlayingInformationUnitViewController : UIViewController
@end

@interface SPTEncoreLabel : UIView
-(UIViewController *)_viewControllerForAncestor;
@end

static SPTNowPlayingInformationUnitViewController *vc = nil;
