#line 1 "Tweak.xm"
#import "Tweak.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SPTNowPlayingInformationUnitViewController; 
static void (*_logos_orig$_ungrouped$SPTNowPlayingInformationUnitViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingInformationUnitViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SPTNowPlayingInformationUnitViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingInformationUnitViewController* _LOGOS_SELF_CONST, SEL); 

#line 3 "Tweak.xm"

static void _logos_method$_ungrouped$SPTNowPlayingInformationUnitViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingInformationUnitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SPTNowPlayingInformationUnitViewController$viewDidLoad(self, _cmd);
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.subtitleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SPTNowPlayingInformationUnitViewController = objc_getClass("SPTNowPlayingInformationUnitViewController"); { MSHookMessageEx(_logos_class$_ungrouped$SPTNowPlayingInformationUnitViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SPTNowPlayingInformationUnitViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SPTNowPlayingInformationUnitViewController$viewDidLoad);}} }
#line 10 "Tweak.xm"
