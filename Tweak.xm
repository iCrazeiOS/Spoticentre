// this code is super bad compared to the original release
// but i just wanna get out a quick patch for the crashes

// plus, it actually works even better than the older version
// ('like song' button no longer gets hidden)

#import "Tweak.h"

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
	}
}
%end



// bad fix for the enhance button
// ideally, I wanted to hook EncoreMobile.AutoLayoutStackView, and get its children
// spotify just didn't like us doing this though :/

%hook UIImageView
-(void)_updateVisibilityAndFrameOfPlaceholderView {
	%orig;
	if ([self.superview.superview class] == objc_getClass("EncoreMobile.AutoLayoutStackView")) {
		CGRect frame = self.frame;
		// move enhance button closer to the artist label
		frame.origin.x += frame.size.width - frame.size.height;
		// fix the button's width
		frame.size.width = frame.size.height;
		self.frame = frame;
	}
}
%end
