include $(TOPDIR)/rules.mk


# PAK NAME 必须和包所在文件夹一样.


PKG_NAME:=openwrt-bin

# 下面三个参数随便填写.
PKG_VERSION:=20200930
PKG_RELEASE:=1
PKG_MAINTAINER:=Y.A.K.E



PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk


# 下面是显示在menuconfig中的菜单路径
# SUBMENU后面跟着的是我自己diy的一个菜单选项,
# 这个菜单里面全是自己的包,比较好找.

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=tools_BIN
	PKGARCH:=all
	TITLE:=tools bin
endef

# 包介绍说明,不要用中文.
define Package/$(PKG_NAME)/description
    tools bin ~~~~
endef



define Package/$(PKG_NAME)/preinst
endef




# 安装后执行的脚本
# 这里大概作用就是安装后给./usr/bin/v2ray添加执行权限.

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	#chmod 755 "$${IPKG_INSTROOT}/usr/bin/cloudflared-linux-arm64" >/dev/null 2>&1
	chmod 755 "$${IPKG_INSTROOT}/usr/bin/natmap" >/dev/null 2>&1
fi
exit 0

endef




define Build/Prepare
endef



define Build/Configure
endef



define Build/Compile
endef



# 安装作业
# 这里一般就是复制文件
# 如果有更多文件直接参考修改,非常简单.


define Package/$(PKG_NAME)/install

	# 两条命令一组
	# 第一条是指定复制到的目录
	# 第二条是拷贝文件.

	#$(INSTALL_DIR) $(1)/usr/bin
	#$(INSTALL_BIN) ./files/cloudflared-linux-arm64 $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/natmap $(1)/usr/bin

endef

$(eval $(call BuildPackage,$(PKG_NAME)))
