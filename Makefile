TARGET := iphone:clang:latest:10.0
PACKAGE_VERSION = 1.7.0~b1

include $(THEOS)/makefiles/common.mk

include $(THEOS_MAKE_PATH)/tweak.mk