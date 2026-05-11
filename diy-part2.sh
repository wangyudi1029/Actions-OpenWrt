#!/bin/bash

# 修改默认IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 修改主机名
sed -i 's/OpenWrt/TR3000/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 编译插件
cat >> .config << EOF

# 中文
CONFIG_PACKAGE_luci-i18n-base-zh-cn=y

# OpenClash
CONFIG_PACKAGE_luci-app-openclash=y

# AdGuardHome
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_adguardhome=y

# USB网络共享
CONFIG_PACKAGE_kmod-usb-net=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_usbmuxd=y
CONFIG_PACKAGE_libimobiledevice=y

# 5G模块
CONFIG_PACKAGE_modemmanager=y
CONFIG_PACKAGE_modemmanager-rpcd=y
CONFIG_PACKAGE_luci-proto-modemmanager=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_umbim=y

# SQM
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_sqm-scripts=y

# 流量监控
CONFIG_PACKAGE_luci-app-nlbwmon=y

# ttyd网页终端
CONFIG_PACKAGE_luci-app-ttyd=y

# 工具
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_bash=y

EOF
