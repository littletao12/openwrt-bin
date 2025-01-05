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
  # If there is no source code to compile, you can leave this empty.
  # You don't need to define a compile step if it's just binaries.
  echo "Skipping compile step"
endef

define Package/mybinaries/install
  # Create the target directory for installation
  $(INSTALL_DIR) $(1)/usr/bin
  
  # Install the binaries into the target directory
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/files/natmap $(1)/usr/bin/
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/files/socat $(1)/usr/bin/
  # If there are more binaries, repeat the line for each
endef

$(eval $(call BuildPackage,mybinaries))
