export PREFIX = /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/
export SDKVERSION = 14.4
export ARCHS = arm64

INSTALL_TARGET_PROCESSES = Spotify

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Spoticentre

Spoticentre_FILES = Tweak.xm
Spoticentre_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
