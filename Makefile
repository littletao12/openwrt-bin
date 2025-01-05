# Package Makefile for OpenWrt
include $(TOPDIR)/rules.mk

PKG_NAME:=mybinaries
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/mybinaries
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=My Binaries
  DEPENDS:=
endef

define Package/mybinaries/description
  This package contains multiple custom binary files.
endef

define Build/Compile
  # 如果有源代码需要编译，可以在这里进行编译
  # 否则，直接跳过
  echo "Skipping compile step"
endef

define Package/mybinaries/install
  $(INSTALL_DIR) $(1)/usr/bin
  $(INSTALL_BIN) ./files/natmap $(1)/usr/bin/
  $(INSTALL_BIN) ./files/socat $(1)/usr/bin/
  #$(INSTALL_BIN) ./files/mybinary3 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,mybinaries))
