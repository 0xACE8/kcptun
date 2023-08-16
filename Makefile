# SPDX-License-Identifier: MIT
#
# Copyright (c) 2023 0xACE7

include $(TOPDIR)/rules.mk

PKG_NAME:=kcptun
PKG_VERSION:=20230811
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE:=kcptun-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/xtaci/kcptun/tar.gz/v${PKG_VERSION}?
PKG_HASH:=dd88c7ddb85cc74ff22940ba2dc22f65d3b6737153b225d611abb801a0694c4d

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=0xACE7

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk

define Package/kcptun
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=KCP-based Secure Tunnel Client v${PKG_VERSION}
  URL:=https://github.com/xtaci/kcptun
  PROVIDES:=kcptun
endef

define Package/kcptun/description
    kcptun is a Stable & Secure Tunnel Based On KCP with N:M Multiplexing.
This package only contains kcptun client
endef

define Package/kcptun/install
  $(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/kcptun-client $(1)/usr/bin
endef

$(eval $(call BuildPackage,kcptun))
