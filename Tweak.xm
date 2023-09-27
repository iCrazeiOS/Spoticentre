#import <UIKit/UIKit.h>

@interface SPTNowPlayingInformationUnitViewController : UIViewController
@end

@interface NowPlayingInformationUnitViewController : UIViewController
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


// a/b testing UI, written in swift
%hook NowPlayingInformationUnitViewController
-(void)viewDidLoad {
	%orig;
	NowPlayingInformationUnitViewController *typedSelf = (NowPlayingInformationUnitViewController *)self;
	UIView *viewIntermediate = typedSelf.view.subviews[0].subviews[0];
	UIView *view = viewIntermediate.subviews[0].subviews[0];
	UIView *track = view.subviews[0];
	UIView *artistIntermediate = view.subviews[1].subviews[0];
	UIView *artist = artistIntermediate.subviews[2].subviews[0];

	// hide buttons on the right side
	if (viewIntermediate.subviews.count > 1) {
		viewIntermediate.subviews[1].hidden = YES;
	}

	// fix issue with enhance/smart shuffle icon being stretched
	for (UIView *subview in artistIntermediate.subviews) {
		if ([subview isKindOfClass:[UIImageView class]]) {
			[typedSelf.view addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:16.f]];
			break;
		}
	}

	[typedSelf.view addConstraint:[NSLayoutConstraint constraintWithItem:track attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:typedSelf.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
	[typedSelf.view addConstraint:[NSLayoutConstraint constraintWithItem:artist attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:typedSelf.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
}
%end


%ctor {
	// swift, yay 🗿
	%init(NowPlayingInformationUnitViewController=NSClassFromString(@"NowPlaying_ViewImpl.NowPlayingInformationUnitViewController"));
}
