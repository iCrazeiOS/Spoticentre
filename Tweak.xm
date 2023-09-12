#import <UIKit/UIKit.h>

@interface SPTNowPlayingInformationUnitViewController : UIViewController
@end

%hook SPTNowPlayingInformationUnitViewController
-(void)setupAddButtonIfNeeded {
	UIView *view = self.view.subviews[0].subviews[0].subviews[0];
	UIView *track = view.subviews[0].subviews[0].subviews[0].subviews[0];
	UIView *artistIntermediate = view.subviews[1].subviews[0];
	UIView *artist = artistIntermediate.subviews[2].subviews[0].subviews[0].subviews[0];

	// fix issue with enhance/smart shuffle icon being stretched
	for (UIView *subview in artistIntermediate.subviews) {
		if ([subview isKindOfClass:[UIImageView class]]) {
			[self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:16.f]];
			break;
		}
	}

	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:track attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:artist attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];

	%orig;
}

// This takes up too much space
// No one really uses it
// So let's remove it :)
-(void)setupMinusButtonIfNeeded {
}
%end
