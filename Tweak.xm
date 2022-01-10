// this code is super bad compared to v1.0.1
// but i just wanna get out a quick patch for the crashes

// plus it actually works even better than the older version
// (like somg button no longer gets hidden)

#import "Tweak.h"

static SPTNowPlayingInformationUnitViewController *vc = nil;

%hook SPTNowPlayingInformationUnitViewController
-(id)setStackView:(id)arg1 {
	vc = self;
	return %orig;
}
%end

%hook SPTEncoreLabel
-(void)_setText:(id)arg1 {
	%orig;
	if (vc && self._viewControllerForAncestor == vc) {
		[vc.view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:vc.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
		[vc.view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:vc.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
	}
}
%end
