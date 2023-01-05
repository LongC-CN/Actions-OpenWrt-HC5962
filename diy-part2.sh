#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
# openwrt banner
rm package/base-files/files/etc/banner
echo " _   _ ___        ___ _____ _" >> package/base-files/files/etc/banner
echo "| | | (_) \      / (_)  ___(_)      Compiled by Long_C" >> package/base-files/files/etc/banner
echo "| |_| | |\ \ /\ / /| | |_  | | -------------------------------" >> package/base-files/files/etc/banner
echo "|  _  | | \ V  V / | |  _| | | Lean's OpenWrt, %C" >> package/base-files/files/etc/banner
echo "|_| |_|_|  \_/\_/  |_|_|   |_| -------------------------------" >> package/base-files/files/etc/banner

cd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
cd ../..

rm -r target/linux/ramips/
cd tmp/
git clone https://github.com/padavanonly/immortalwrt.git
cp -r ./immortalwrt/target/linux/ramips/ ../target/linux/ramips/
rm -r immortalwrt/
cd ..
