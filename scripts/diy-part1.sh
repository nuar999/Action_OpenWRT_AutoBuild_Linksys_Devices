#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Updated By Eliminater74 06/18/2021
################################################################################

### Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default


### luci-app-log
git clone https://github.com/DevOpenWRT-Router/luci-app-log.git package/luci-app-log
### luci-app-mqos
git clone https://github.com/DevOpenWRT-Router/luci-app-mqos.git package/luci-app-mqos
### luci-app-filebrowser
git clone https://github.com/xiaozhuai/luci-app-filebrowser.git package/luci-app-filebrowser
### luci-app-eqos
git clone https://github.com/MapesxGM/luci-app-eqos.git package/luci-app-eqos
### luci-app-advanced
git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
### luci-app-onliner
git clone https://github.com/rufengsuixing/luci-app-onliner.git package/luci-app-onliner
### luci-app-disks-info
git clone https://github.com/DevOpenWRT-Router/luci-app-disks-info.git package/luci-app-disks-info
### luci-app-netmap
git clone https://github.com/DevOpenWRT-Router/luci-app-netmap.git package/luci-app-netmap
### NetSpeedTest
git clone https://github.com/DevOpenWRT-Router/netspeedtest.git package/NetSpeedTest
### luci-app-fileassistant
git clone https://github.com/gztingting/luci-app-fileassistant.git package/luci-app-fileassistant
### luci-app-wifimac
git clone https://github.com/qianmuyixiao/luci-app-wifimac.git package/luci-app-wifimac
### luci-app-serverchan #WeChat push
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan

### luci-app-diskman
## A Simple Disk Manager for LuCI, support disk partition and format, support raid / btrfs-raid / btrfs-snapshot
mkdir -p package/luci-app-diskman
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile

### LIBS: libdouble-conversion NEEDED for qBittorrent qt5
mkdir -p package/libs/libdouble-conversion
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/libs/libdouble-conversion/Makefile -O package/libs/libdouble-conversion/Makefile

### lean synced from lede source
echo "Downloading coolsnowwolf's lean packages"
git clone https://github.com/DevOpenWRT-Router/openwrt-package-lean.git package/lean
rm -rf ./package/lean/luci-theme-argon # Delete Lean's own argon theme
rm -rf ./package/lean/luci-app-netdata # Delete Lean's own luci-app-netdata
rm -rf ./package/lean/luci-app-dnsfilter # Delete Lean's Own luci-app-dnsfilter
rm -rf ./package/lean/default-settings # Delete lean's own default-settings
# rm -rf ./package/lean/luci-app-turboacc # Delete lean's own luci-app-turboacc
# rm -rf ./package/lean/luci-app-flowoffload # Delete lean's own luci-app-flowoffload
rm -rf ./package/lean/.sync.sh # Delete lean's sync.sh files
rm -rf ./package/lean/.list.txt # Delete lean's list.txt file

# WARNING: Not overriding core package 'csstidy'; use -f to force
# WARNING: Not overriding core package 'luci-app-frpc'; use -f to force
# WARNING: Not overriding core package 'luci-app-frps'; use -f to force
# WARNING: Not overriding core package 'luci-app-nft-qos'; use -f to force
# WARNING: Not overriding core package 'luci-app-samba4'; use -f to force
# WARNING: Not overriding core package 'luci-app-ttyd'; use -f to force
# WARNING: Not overriding core package 'luci-lib-docker'; use -f to force
# WARNING: Not overriding core package 'luci-proto-bonding'; use -f to force

### luci-app-turboacc
# git clone https://github.com/deplives/luci-app-turboacc.git package/luci-app-turboacc
# get clone https://github.com/deplives/luci-app-flowoffload.git package/luci-app-flowoffload

### luci-app-dnsfilter
git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter

### luci-app-netdata
git clone https://github.com/DevOpenWRT-Router/luci-app-netdata.git package/luci-app-netdata

### Use lede's edition of mwlwifi
rm -rf ./package/kernel/mwlwifi # Delete openWRT's version replace with sync lede
git clone https://github.com/DevOpenWRT-Router/openwrt-package-kernel-mwlwifi.git package/kernel/mwlwifi

### luci-app-usbnet
git clone https://github.com/a920025608/luci-app-usbnet.git package/luci-app-usbnet
git clone https://github.com/a920025608/usbnet.git package/usbnet

echo "Downloading sirpdboy's packages Visa SVN"
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-argon_new package/sirpdboy/luci-theme-argon_new
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-atmaterial package/sirpdboy/luci-theme-atmaterial
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-btmod package/sirpdboy/luci-theme-btmod
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-edge package/sirpdboy/luci-theme-edge
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-ifit package/sirpdboy/luci-theme-ifit
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-opentomato package/sirpdboy/luci-theme-opentomato
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-opentomcat package/sirpdboy/luci-theme-opentomcat
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-opentopd package/sirpdboy/luci-theme-opentopd
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-cpulimit package/sirpdboy/luci-app-cpulimit
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/cpulimit package/sirpdboy/cpulimit
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-rebootschedule package/sirpdboy/luci-app-rebootschedule
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-timecontrol package/sirpdboy/luci-app-timecontrol
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/speedtest-cli package/sirpdboy/speedtest-cli
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/ package/sirpdboy/
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/ package/sirpdboy/
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/ package/sirpdboy/
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/ package/sirpdboy/

### ----------------------------------------------------------------------- ###
### THEMES ###
### new argon theme
git clone -b master https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
### New argon theme control program
git clone -b master https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
### luci-theme-edge2 ###
#git clone -b main https://github.com/YL2209/luci-theme-edge2.git package/luci-theme-edge2
### luci-theme-opentopd thme openwrt theme
#git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
### btmod theme
#git clone https://github.com/sirpdboy/luci-theme-btmod.git package/luci-theme-btmob
### luci-theme-opentomcat
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
### luci-theme-netgear
#git clone https://github.com/i028/luci-theme-netgear.git package/luci-theme-netgear
### luci-theme-ifit
#git clone https://github.com/YL2209/luci-theme-ifit.git package/luci-theme-ifit
### luci-theme-surfboard
#git clone https://github.com/SURFBOARD-ONE/luci-theme-surfboard.git package/luci-theme-surfboard
### luci-theme-atmaterial
#git clone https://github.com/miccjing/luci-theme-atmaterial.git package/luci-theme-atmaterial
### luci-theme-mcat
#git clone https://github.com/fszok/luci-theme-mcat.git package/luci-theme-mcat
### luci-theme-fate
#git clone https://github.com/fatelpc/luci-theme-fate.git package/luci-theme-fate
### ----------------------------------------------------------------------- ###


echo "End of diy-part1.sh"
exit 0
