#!/bin/bash

# 初始化环境
sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
sudo -E apt-get -qq update
sudo locale-gen en_US.UTF-8
sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
sudo -E sudo apt-get install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc-s1 libc6-dev-i386 subversion flex uglifyjs git gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx-ucl libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
sudo -E apt-get -qq install python3-pip
sudo -E pip install pyelftools
sudo -E apt-get -qq autoremove --purge
sudo -E apt-get -qq clean
sudo timedatectl set-timezone "Asia/Shanghai"
sudo mkdir -p /workdir
sudo chown $USER:$GROUPS /workdir

# 克隆源代码
cd /workdir
git clone https://github.com/coolsnowwolf/lede -b master

# 加载自定义feeds
cd openwrt
./SCRIPTS/R5S/r5s-part1.sh

# 更新feeds
./scripts/feeds update -a

# 安装feeds
./scripts/feeds install -a

# 加载自定义配置
./SCRIPTS/R5S/r5s-part2.sh

# 下载包
make defconfig
make download -j8
find dl -size -1024c -exec ls -l {} \;
find dl -size -1024c -exec rm -f {} \;

# 编译固件
echo -e "$(nproc) thread compile"
make -j$(($(nproc) + 1)) || make -j$(($(nproc) + 1)) V=s