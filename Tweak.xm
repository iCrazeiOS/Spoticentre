#import <UIKit/UIKit.h>

@interface SPTNowPlayingInformationUnitViewController : UIViewController
@end

%hook SPTNowPlayingInformationUnitViewController
-(void)setupAddButtonIfNeeded {
	UIView *view = self.view.subviews[0].subviews[0].subviews[0];
	UIView *track = view.subviews[0].subviews[0].subviews[0].subviews[0];
	UIView *artist = view.subviews[1].subviews[0].subviews[2].subviews[0].subviews[0].subviews[0];

	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:track attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:artist attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];

	%orig;
}
%end
