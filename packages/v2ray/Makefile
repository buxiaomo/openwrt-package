#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=v2ray
PKG_VERSION:=4.23.1
PKG_RELEASE:=1

ifeq ($(ARCH),x86_64)
	PKG_ARCH_V2RAY:=64
endif
ifeq ($(ARCH),mipsel)
	PKG_ARCH_V2RAY:=mipsle
endif
ifeq ($(ARCH),mips)
	PKG_ARCH_V2RAY:=mips
endif
ifeq ($(ARCH),i386)
	PKG_ARCH_V2RAY:=32
endif
ifeq ($(ARCH),arm)
	PKG_ARCH_V2RAY:=arm
	ifneq ($(BOARD),bcm53xx)
		V2RAY_BIN:=v2ray_armv7
  endif
  ifeq ($(BOARD),kirkwood)
		V2RAY_BIN:=v2ray
  endif
endif
ifeq ($(ARCH),aarch64)
	PKG_ARCH_V2RAY:=arm64
endif

PKG_LICENSE:=Apache-2.0

PKG_SOURCE_URL:=https://github.com/v2ray/v2ray-core/releases/download/v$(PKG_VERSION)
PKG_SOURCE:=v2ray-linux-$(PKG_ARCH_V2RAY).zip
PKG_HASH:=skip

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net	
	CATEGORY:=Network
	TITLE:=V2Ray is a cross-platform proxy software
	DEPENDS:=+ca-certificates
	URL:=https://github.com/v2ray/v2ray-core
endef

define Package/$(PKG_NAME)/description
V2Ray is a cross-platform proxy software
endef

define Build/Prepare
	$(PKG_UNPACK)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/v2ray
	$(INSTALL_BIN) $(BUILD_DIR)/v2ray $(1)/usr/bin/v2ray/v2ray
	$(INSTALL_BIN) $(BUILD_DIR)/geoip.dat $(1)/usr/bin/v2ray/geoip.dat
	$(INSTALL_BIN) $(BUILD_DIR)/geosite.dat $(1)/usr/bin/v2ray/geosite.dat
endef

$(eval $(call BuildPackage,$(PKG_NAME)))