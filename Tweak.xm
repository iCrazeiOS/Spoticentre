@interface SPTNowPlayingInformationUnitViewController : UIViewController
@property UIView *titleLabel;
@property UIView *subtitleLabel;
@end

%hook SPTNowPlayingInformationUnitViewController
-(void)viewDidLoad {
	%orig;
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.subtitleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
}
%end
