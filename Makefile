include $(TOPDIR)/rules.mk

PKG_NAME:=openwrt-bin
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/openwrt-bin
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=My Binaries
  DEPENDS:=
endef

define Package/openwrt-bin/description
  This package contains multiple custom binary files.
endef

define Build/Compile
  # No source code to compile, skipping compile step
  echo "Skipping compile step"
endef

define Package/openwrt-bin/install
  # Create the target directory for installation
  $(INSTALL_DIR) $(1)/usr/bin
  
  # Install the binaries into the target directory
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/files/natmap $(1)/usr/bin/
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/files/socat $(1)/usr/bin/
endef

$(eval $(call BuildPackage,openwrt-bin))
