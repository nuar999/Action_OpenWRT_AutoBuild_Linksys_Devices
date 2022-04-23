#!/bin/bash
#
# Copyright (c) 2022 By Eliminater74
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# File name: fetch_packages.sh
# Description: OpenWRT Packages
#
# Updated By Eliminater74
################################################################################

### -------------------------------------------------------------------------------------------------------------- ###
echo " Fetching All Personal Repo's"

PERSONAL_PACKAGES() {
echo "Fetching From DevOpenWRT-Router:"

### luci-app-mqos
git clone https://github.com/DevOpenWRT-Router/luci-app-mqos.git package/luci-app-mqos
### luci-default-settings
git clone https://github.com/DevOpenWRT-Router/luci-default-settings.git package/luci-default-settings
### my-default-settings (LUCI)
git clone https://github.com/DevOpenWRT-Router/my-default-settings.git package/my-default-settings

echo "END Fetching From DevOpenWRT-Router:"
}

UNSORTED_GIT_PACKAGES(){
  echo "Fetching UN-Sorted GIT Packages:"
  
  ### luci-app-access
  git clone https://github.com/resmh/luci-app-access.git package/luci-app-access
  rm -rf package/luci-app-access/po

  ### luci-app-webguide
  git clone https://github.com/p1ay8y3ar/luci-app-webguide.git package/p1ay8y3ar/luci-app-webguide
  rm -rf package/p1ay8y3ar/luci-app-webguide/lights-app-webguide/po

  ### openwrt-apps
  git clone https://github.com/jjm2473/openwrt-apps.git package/jjm2473/openwrt-apps
  rm -rf package/jjm2473/openwrt-apps/luci-app-ota/po
  rm -rf package/jjm2473/openwrt-apps/luci-app-homebox/po
  rm -rf package/jjm2473/openwrt-apps/luci-app-cpufreq # <-- We dont need this again

  ### autocore-arm-x86
  #git clone https://github.com/MatJeheyy/autocore-arm-x86.git package/MatJeheyy/autocore
  #rm -rf package//MatJeheyy/autocore/po
}


UNSORTED_PACKAGES() {
echo "Fetching From unSorted Repo's:"

### luci-app-diskman
## A Simple Disk Manager for LuCI, support disk partition and format, support raid / btrfs-raid / btrfs-snapshot
mkdir -p package/luci-app-diskman
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
mkdir -p package/parted
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile

echo "END Fetching From unSorted Repo's:"
}

echo "End of Fetching All Personal Repos"

SBWM1_PACKAGES() {
  ### autocore-arm
  git clone https://github.com/sbwml/autocore-arm.git package/sbwml/autocore-arm
  rm -rf package/sbwml/autocore-arm/po
  ### openwrt-qBittorrent-Enhanced-Edition
  git clone https://github.com/sbwml/openwrt-qBittorrent-Enhanced-Edition.git package/sbwml/openwrt-qBittorrent-Enhanced-Edition
  rm -rf package/sbwml/openwrt-qBittorrent-Enhanced-Edition/luci-app-qbittorrent/po
  ### openwrt-qBittorrent
  git clone https://github.com/sbwml/openwrt-qBittorrent.git package/sbwml/openwrt-qBittorrent
  rm -rf package/sbwml/openwrt-qBittorrent/luci-app-qbittorrent/po
  ### openwrt-filebrowser
  git clone https://github.com/sbwml/openwrt-filebrowser.git package/sbwml/openwrt-filebrowser
  rm -rf package/sbwml/openwrt-filebrowser/luci-app-filebrowser/po
  ### OpenAppFilter
  git clone https://github.com/sbwml/OpenAppFilter.git package/sbwml/OpenAppFilter
  rm -rf package/sbwml/OpenAppFilter/luci-app-oaf/po
  ### openwrt-alist
  git clone https://github.com/sbwml/openwrt-alist.git package/sbwml/openwrt-alist
  rm -rf package/sbwml/openwrt-alist/luci-app-alist/po

  echo "END Fetching From sbwml's Repos:"
}

GSPOTX2F_PACKAGES() {
  ### package/luci-app-cpu-status
  git clone https://github.com/gSpotx2f/luci-app-cpu-status.git package/gSpotx2f/luci-app-cpu-status
  rm -rf package/gSpotx2f/luci-app-cpu-status/po

  ### luci-app-cpu-perf
  git clone https://github.com/gSpotx2f/luci-app-cpu-perf.git package/gSpotx2f/luci-app-cpu-perf
  rm -rf package/gSpotx2f/luci-app-cpu-perf/po

  ### luci-app-interfaces-statistics
  git clone https://github.com/gSpotx2f/luci-app-interfaces-statistics.git package/gSpotx2f/luci-app-interfaces-statistics
  rm -rf package/gSpotx2f/luci-app-interfaces-statistics/po

  ### luci-app-internet-detector
  git clone https://github.com/gSpotx2f/luci-app-internet-detector.git package/gSpotx2f/luci-app-internet-detector
  rm -rf package/gSpotx2f/luci-app-internet-detector/po

  ### luci-app-log
  git clone https://github.com/gSpotx2f/luci-app-log.git package/gSpotx2f/luci-app-log
  rm -rf package/gSpotx2f/luci-app-log/po

  ### luci-app-temp-status
  git clone https://github.com/gSpotx2f/luci-app-temp-status.git package/gSpotx2f/luci-app-temp-status
  rm -rf package/gSpotx2f/luci-app-temp-status/po
  
  ### luci-app-disks-info
  git clone https://github.com/gSpotx2f/luci-app-disks-info.git package/gSpotx2f/luci-app-disks-info
  rm -rf package/gSpotx2f/luci-app-disks-info/po

  echo "END Fetching From gSpotx2f's Repos:"
}

KENZOK8_PACKAGES() {
echo "Downloading Kenzok8's small-packages"

i=0
len=0
unset packages
unset url
unset placement
url="https://github.com/kenzok8/small-package/trunk"
placement="package/kenzok8"

while read -r line
do
    packages[ $i ]="$line"
    if [[ ${line} != *"/" ]];then
      echo "$line Doesnt Contain /"; continue
      elif [[ ${line} == "doc" ]];then
      echo "$line Contains doc"
      fi
    (( i++ ))
done < <(svn list $url)

## get length of $packages array
len=${#packages[@]}
echo "$len Packages"

## Use bash for loop
for (( i=0; i<len; i++ ))
do
  echo "${packages[$i]}"
  svn co $url/"${packages[$i]}" $placement/"${packages[$i]}"
  
done

rm -rf package/kenzok8/my-default-settings # using a dif
rm -rf package/kenzok8/my-autocore # Using the one above in unsorted
rm -rf package/kenzok8/mosdns # Build Errors
rm -rf package/kenzok8/luci-app-mosdns
rm -rf package/kenzok8/luci-app-netspeedtest
rm -rf package/kenzok8/v2ray-core
rm -rf package/kenzok8/v2ray-geodata
rm -rf package/kenzok8/v2ray-plugin
rm -rf package/kenzok8/v2raya
rm -rf package/kenzok8/.github
rm -rf package/kenzok8/main.sh
rm -rf package/kenzok8/LICENSE
rm -rf package/kenzok8/README.md

}
### -------------------------------------------------------------------------------------------------------------- ###
LEAN_PACKAGES() {
echo "Downloading coolsnowwolf's lean packages"

i=0
len=0
unset packages
unset url
unset placement
url="https://github.com/coolsnowwolf/lede/trunk/package/lean"
placement="package/lean"

while read -r line
do
    packages[ $i ]="$line"
    if [[ ${line} != *"/" ]];then
      echo "$line Doesnt Contain /"; continue
      elif [[ ${line} == "doc" ]];then
      echo "$line Contains doc"
      fi
    (( i++ ))
done < <(svn list $url)

## get length of $packages array
len=${#packages[@]}
echo "$len Packages"

## Use bash for loop
for (( i=0; i<len; i++ ))
do
  echo "${packages[$i]}"
  svn co $url/"${packages[$i]}" $placement/"${packages[$i]}"
  
done

rm -rf package/lean/autocore
rm -rf package/lean/UnblockNeteaseMusic
rm -rf package/lean/UnblockNeteaseMusicGo
rm -rf package/lean/automount
rm -rf package/lean/autosamba
rm -rf package/lean/csstidy
rm -rf package/lean/default-settings
rm -rf package/lean/frp
rm -rf package/lean/luci-app-dnsfilter
rm -rf package/lean/luci-app-frpc
rm -rf package/lean/luci-app-frps
rm -rf package/lean/luci-app-netdata
rm -rf package/lean/luci-app-nft-qos
rm -rf package/lean/luci-app-samba4
rm -rf package/lean/luci-app-ttyd
rm -rf package/lean/luci-app-unblockmusic
rm -rf package/lean/luci-lib-docker
rm -rf package/lean/luci-proto-bonding
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-theme-netgear
rm -rf package/lean/mt # Some Error Keeps happening #

echo "END of coolsnowwolf's lean packages"
### Needed for qBittorrent qt5
echo "Add coolsnowwolf's libdouble-conversion"
svn co https://github.com/coolsnowwolf/lede/trunk/package/libs/libdouble-conversion package/libs/libdouble-conversion
echo "END coolsnowwolf's libdouble-conversion"
### Use lede's edition of mwlwifi
echo "Add coolsnowwolf's edition of mwlwifi"
rm -rf ./package/kernel/mwlwifi # Delete openWRT's version replace with sync lede
svn co https://github.com/coolsnowwolf/lede/trunk/package/kernel/mwlwifi package/kernel/mwlwifi
echo "END coolsnowwolf's edition of mwlwifi"
}

### -------------------------------------------------------------------------------------------------------------- ###
SIRPDBOY_PACKAGES() {
echo "Downloading sirpdboy's packages"

## Sirpdboy's luci-app-netdata
git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
## Sirpdboy's myautocore enhanced version preview information only for OPENWRT
svn co https://github.com/sirpdboy/myautocore/trunk/myautocore package/sirpdboy/myautocore

i=0
len=0
unset packages
unset url
unset placement
url="https://github.com/sirpdboy/sirpdboy-package/trunk"
placement="package/sirpdboy"

while read -r line
do
    packages[ $i ]="$line"
    if [[ ${line} != *"/" ]];then
      echo "$line Doesnt Contain /"; continue
      elif [[ ${line} == "doc" ]];then
      echo "$line Contains doc"
      fi
    (( i++ ))
done < <(svn list $url)

## get length of $packages array
len=${#packages[@]}
echo "$len Packages"

## Use bash for loop
for (( i=0; i<len; i++ ))
do
  echo "${packages[$i]}"
  svn co $url/"${packages[$i]}" $placement/"${packages[$i]}"
  
done

rm -rf package/sirpdboy/adguardhome
rm -rf package/sirpdboy/doc
rm -rf package/sirpdboy/luci-app-access-control ## NEEDS FIXED
rm -rf package/sirpdboy/luci-app-baidupcs-web
rm -rf package/sirpdboy/luci-app-chinadns-ng
rm -rf package/sirpdboy/luci-app-cpulimit
rm -rf package/sirpdboy/luci-app-dockerman
rm -rf package/sirpdboy/luci-app-easymesh
rm -rf package/sirpdboy/luci-app-netdata
rm -rf package/sirpdboy/luci-app-netspeedtest
rm -rf package/sirpdboy/luci-app-onliner
rm -rf package/sirpdboy/luci-app-ramfree
rm -rf package/sirpdboy/luci-app-rebootschedule
rm -rf package/sirpdboy/luci-app-smartdns
rm -rf package/sirpdboy/luci-app-socat
rm -rf package/sirpdboy/luci-app-timecontrol
rm -rf package/sirpdboy/luci-app-wrtbwmon
rm -rf package/sirpdboy/luci-theme-argon_new
rm -rf package/sirpdboy/luci-theme-atmaterial
rm -rf package/sirpdboy/luci-theme-btmod
rm -rf package/sirpdboy/luci-theme-edge
rm -rf package/sirpdboy/luci-theme-ifit
rm -rf package/sirpdboy/luci-theme-opentomato
rm -rf package/sirpdboy/luci-theme-opentomcat
rm -rf package/sirpdboy/luci-theme-opentopd
rm -rf package/sirpdboy/netdata
rm -rf package/sirpdboy/speedtest-cli ## NEEDS FIXED
rm -rf package/sirpdboy/smartdns ## NEEDS FIXED

echo "END of sirpdboy's packages"

echo "From sirpdboy's BUILD packages"

i=0
len=0
unset packages
unset url
unset placement
url="https://github.com/sirpdboy/build/trunk"
placement="package/sirpdboy"

while read -r line
do
    packages[ $i ]="$line"
    if [[ ${line} != *"/" ]];then
      echo "$line Doesnt Contain /"; continue
      elif [[ ${line} == "doc" ]];then
      echo "$line Contains doc"
      fi
    (( i++ ))
done < <(svn list $url)

## get length of $packages array
len=${#packages[@]}
echo "$len Packages"

## Use bash for loop
for (( i=0; i<len; i++ ))
do
  echo "${packages[$i]}"
  svn co $url/"${packages[$i]}" $placement/"${packages[$i]}"
  
done

#rm -rf  package/sirpdboy/autocore
rm -rf package/sirpdboy/automount
rm -rf package/sirpdboy/autosamba-samba4
rm -rf package/sirpdboy/default-settings # using a dif
rm -rf package/sirpdboy/doc # not a package
rm -rf package/sirpdboy/gcc # not a package
rm -rf package/sirpdboy/ksmbd-tools
rm -rf package/sirpdboy/luci-app-ksmbd
rm -rf package/sirpdboy/luci-app-samba
rm -rf package/sirpdboy/luci-app-samba4
rm -rf package/sirpdboy/miniupnpd
rm -rf package/sirpdboy/mwan3
rm -rf package/sirpdboy/samba36
rm -rf package/sirpdboy/samba4
rm -rf package/sirpdboy/my-autocore
rm -rf package/sirpdboy/autocore
rm -rf package/sirpdboy/mycore
rm -rf package/sirpdboy/pass
rm -rf package/sirpdboy/set # Not a package
rm -rf package/sirpdboy/socat

echo "END of sirpdboy's Build packages"
}

### -------------------------------------------------------------------------------------------------------------- ###
HELMIAU_PACKAGES() {
echo "Downloading helmiau's packages"

i=0
len=0
unset packages
unset url
unset placement
url="https://github.com/helmiau/helmiwrt-packages/trunk"
placement="package/helmiau"

while read -r line
do
    packages[ $i ]="$line"
    if [[ ${line} != *"/" ]];then
      echo "$line Doesnt Contain /"; continue
      elif [[ ${line} == "doc" ]];then
      echo "$line Contains doc"
      fi
    (( i++ ))
done < <(svn list $url)

## get length of $packages array
len=${#packages[@]}
echo "$len Packages"

## Use bash for loop
for (( i=0; i<len; i++ ))
do
  echo "${packages[$i]}"
  svn co $url/"${packages[$i]}" $placement/"${packages[$i]}"
  
done

rm -rf package/helmiau/badvpn
rm -rf package/helmiau/build-ipk
rm -rf package/helmiau/corkscrew
rm -rf package/helmiau/preview

echo "END of helmiau's Build packages"
}

### -------------------------------------------------------------------------------------------------------------- ###
NUEXINI_PACKAGES() {
echo "Downloading NueXini's packages"

i=0
len=0
unset packages
unset url
unset placement
url="https://github.com/NueXini/NueXini_Packages/trunk"
placement="package/NueXini"

while read -r line
do
    packages[ $i ]="$line"
    if [[ ${line} != *"/" ]];then
      echo "$line Doesnt Contain /"; continue
      elif [[ ${line} == "doc" ]];then
      echo "$line Contains doc"
      fi
    (( i++ ))
done < <(svn list $url)

## get length of $packages array
len=${#packages[@]}
echo "$len Packages"

## Use bash for loop
for (( i=0; i<len; i++ ))
do
  echo "${packages[$i]}"
  svn co $url/"${packages[$i]}" $placement/"${packages[$i]}"
  
done

rm -rf package/NueXini/autocore
rm -rf package/NueXini/mosdns
rm -rf package/NueXini/luci-app-mosdns

echo "END of NueXini's Build packages"
}

LUCI_THEMES() {
  echo "Fetching LUCI-Themes"
  ### THEMES ###
  ### new argon theme
  # git clone -b master https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
  ### New argon theme control program
  # git clone -b master https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
  ### luci-theme-opentomcat
  # git clone https://github.com/chaoxiaozhu/luci-theme-opentomcat.git package/luci-theme-opentomcat
  ### luci-theme-rosy
  # git clone https://github.com/rosywrt/luci-theme-rosy.git package/luci-theme-rosy
  ### luci-theme-netgear
  # git clone https://github.com/ysoyipek/luci-theme-netgear.git package/luci-theme-netgear
  ### luci-theme-edge2 ###
  # git clone -b main https://github.com/YL2209/luci-theme-edge2.git package/luci-theme-edge2
  ### luci-theme-opentopd thme openwrt theme
  # git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
  ### btmod theme
  # git clone https://github.com/sirpdboy/luci-theme-btmod.git package/luci-theme-btmob
  ### luci-theme-opentomcat
  # git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
  ### luci-theme-netgear
  # git clone https://github.com/i028/luci-theme-netgear.git package/luci-theme-netgear
  ### luci-theme-ifit
  # git clone https://github.com/YL2209/luci-theme-ifit.git package/luci-theme-ifit
  ### luci-theme-surfboard
  # git clone https://github.com/SURFBOARD-ONE/luci-theme-surfboard.git package/luci-theme-surfboard
  ### luci-theme-atmaterial
  # git clone https://github.com/miccjing/luci-theme-atmaterial.git package/luci-theme-atmaterial
  ### luci-theme-mcat
  # git clone https://github.com/fszok/luci-theme-mcat.git package/luci-theme-mcat
  ### luci-theme-fate
  # git clone https://github.com/fatelpc/luci-theme-fate.git package/luci-theme-fate
  echo "Done Fetching LUCI-Themes"
}

### -------------------------------------------------------------------------------------------------------------- ###

LUCI_THEMES;
PERSONAL_PACKAGES;
UNSORTED_GIT_PACKAGES;
UNSORTED_PACKAGES;
SBWM1_PACKAGES;
GSPOTX2F_PACKAGES;
KENZOK8_PACKAGES;
LEAN_PACKAGES;
SIRPDBOY_PACKAGES;
HELMIAU_PACKAGES;
NUEXINI_PACKAGES;
### -------------------------------------------------------------------------------------------------------------- ###

exit 0
