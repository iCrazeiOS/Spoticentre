#import <UIKit/UIKit.h>

@interface SPTNowPlayingInformationUnitViewController : UIViewController
@end

@interface SPTEncoreLegacyLabel : UIView
-(UIViewController *)_viewControllerForAncestor;
@end

static SPTNowPlayingInformationUnitViewController *vc = nil;
