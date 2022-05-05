ARCHS = arm64 arm64e
export SDKVERSION = 12.4

INSTALL_TARGET_PROCESSES = Spotify

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Spoticentre

Spoticentre_FILES = Tweak.xm
Spoticentre_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
