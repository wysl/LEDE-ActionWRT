# Delete old files
rm -rf lede

# Clone new lede
git clone https://github.com/LeXwDeX/LEDE
cd lede

# Add SSRP
sed -i "/helloworld/d" "feeds.conf.default"
echo "src-git helloworld https://github.com/LeXwDeX/helloworld" >> "feeds.conf.default"

# Update and install feeds
./scripts/feeds update -a
./scripts/feeds install -a

# # Passwall
# git clone -b packages --depth=1 https://github.com/xiaorouji/openwrt-passwall.git ./package/lean/passwall_package
# git clone -b luci --depth=1 https://github.com/xiaorouji/openwrt-passwall.git ./package/lean/passwall
# cp -rf ./package/lean/passwall_package/* ./package/lean/passwall
# rm -rf ./package/lean/passwall_package

# Openclash
git clone -b master --depth=1 https://github.com/vernesong/OpenClash.git ./package/lean/luci-app-openclash
mkdir -p ./package/lean/openclash
cp -rf ./package/lean/luci-app-openclash/luci-app-openclash/* ./package/lean/openclash
rm -rf ./package/lean/luci-app-openclash

# # Mosdns
# # find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f
# find ./ | grep Makefile | grep luci-app-mosdns | xargs rm -f
# git clone -b master --depth=1 https://github.com/QiuSimons/openwrt-mos ./package/mosdns

# Theme Argon config
rm -rf ./package/feeds/luci/luci-theme-argon
git clone -b 18.06 --depth=1 https://github.com/jerrykuku/luci-theme-argon.git ./package/lean/luci-theme-argon
git clone -b master --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.1/g' package/base-files/files/bin/config_generate

# Modify default Hostname
sed -i 's/OpenWrt/LEDE/g' package/base-files/files/bin/config_generate

# Menuconfig
make menuconfig

# Make seed file
make defconfig
./scripts/diffconfig.sh > seed.config
