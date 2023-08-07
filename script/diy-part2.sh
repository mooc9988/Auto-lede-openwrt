#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 修改openwrt登陆地址,把下面的192.168.123.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把tx1801修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/H3C_TX1801_PLUS/g' package/base-files/files/bin/config_generate

# 修改开源驱动wifi名称
#sed -i 's/OpenWrt/H3C_TX1801_PLUS-$/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改闭源驱动2G wifi名称
sed -i 's/OpenWrt/H3C_TX1801_PLUS-$/g' package/lean/mt/drivers/mt_wifi/files/mt7615.1.2G.dat
#sed -i 's/OpenWrt/H3C_TX1801_PLUS-$/g' package/lean/MTK7615-DBDC-LINUX5.4/drivers/mt_wifi/files/mt7615.1.2G.dat
sed -i 's/OpenWrt/H3C_TX1801_PLUS-$/g' package/lean/mt/drivers/mt_wifi/files/mt7615.2G.dat
sed -i 's/OpenWRT-2.4G/H3C_TX1801_PLUS/g' package/lean/mt/drivers/mt7615d/files/lib/wifi/mt_dbdc.sh

# 修改闭源驱动5G wifi名称
sed -i 's/OpenWrt_5G/H3C_TX1801_PLUS-5G-$/g' package/lean/mt/drivers/mt_wifi/files/mt7615.1.5G.dat
#sed -i 's/OpenWrt_5G/H3C_TX1801_PLUS-5G-$/g' package/lean/MTK7615-DBDC-LINUX5.4/drivers/mt_wifi/files/mt7615.1.5G.dat
sed -i 's/OpenWrt_5G/H3C_TX1801_PLUS-5G-$/g' package/lean/mt/drivers/mt_wifi/files/mt7615.5G.dat
sed -i 's/OpenWRT-5G/H3C_TX1801_PLUS-5G/g' package/lean/mt/drivers/mt7615d/files/lib/wifi/mt_dbdc.sh

# 添加个性信息
#sed -i 's/22.6.16/22.6.16 by nanchuci/g' ./package/lean/default-settings/files/zzz-default-settings

# 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
#rm -rf ./package/base-files/files/etc/banne && cd .. && cp -f ./banner openwrt/package/base-files/files/etc/ && cd openwrt

# 更改时区
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# Clone community packages to package/community
#mkdir package/community
#pushd package/community

# Add Lienol's Packages
#git clone --depth=1 https://github.com/Lienol/openwrt-package

# Add luci-app-eqos
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-eqos

# Add dnsfilter
#git clone --depth=1 https://github.com/garypang13/luci-app-dnsfilter

# Add luci-app-passwall
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add luci-app-vssr <M>
#git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
#git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add mentohust & luci-app-mentohust
#git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
#git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add lua-ipops
#svn co https://github.com/x-wrt/com.x-wrt/trunk/lua-ipops

# Add luci-app-natflow-users
#svn co https://github.com/x-wrt/com.x-wrt/trunk/luci-app-natflow-users

# Add natflow
#svn co https://github.com/x-wrt/com.x-wrt/trunk/natflow

# Add iptvhelper & luci-app-iptvhelper
#svn co https://github.com/kiddin9/openwrt-packages/trunk/iptvhelper
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper

# Add luci-app-gpsysupgrade
#svn co https://github.com/kiddin9/my-packages/trunk/luci-app-gpsysupgrade

# Add OpenClash
#git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner (need luci-app-nlbwmon)
#git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-adguardhome
#git clone --depth=1 https://github.com/SuLingGG/luci-app-adguardhome

# Add luci-app-diskman
#git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
#mkdir parted
#cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
#rm -rf ../lean/luci-app-docker
#git clone --depth=1 https://github.com/KFERMercer/luci-app-dockerman
#git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-app-store
#svn co https://github.com/linkease/istore/trunk/luci/luci-app-store

# Add luci-app-nat6-helper
#git clone --depth=1 https://github.com/Ausaci/luci-app-nat6-helper

# Add luci-theme-argon
#cd lede/package/lean
#rm -rf luci-theme-argon 
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
