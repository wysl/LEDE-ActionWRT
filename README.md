# LEDE-ActionWRT
- 使用GitHub Actions为X86/R5S构建OpenWrt。
- R5S版本非常激进。
- 请确保在使用前，你能接受如断线和崩溃等各种意外情况。

## 提示
- 默认登录地址是[192.168.50.1](http://192.168.50.1)
- 默认用户名是root，密码是password。（适用于所有版本）
- 这个版本的OpenWrt非常简单。它只有luci应用的一小部分。
- 如果你想要更多的应用，可以fork我的仓库并制作你自己的版本。
- 或者，你可以使用ssh操作来制作你自己的版本。

## 如何构建自己的固件
- 点击Fork按钮创建一个新的仓库。
- 使用[LEDE](https://github.com/coolsnowwolf/lede)（适用于x86和acrh17）或[ImmortalWrt](https://github.com/immortalwrt/immortalwrt/tree/master) （适用于其他）源代码生成.config文件。
- 你可以通过工作流文件中的环境变量更改源代码。[**教程**](https://p3terx.com/archives/build-openwrt-with-github-actions.html)
- 将你自己的seed.config添加到SEED文件夹。[**教程**](https://github.com/coolsnowwolf/lede/issues/2288)
- 在Actions页面上选择`Build 对应平台`。
- 点击`Run workflow`按钮。
- 当构建完成后，点击Actions页面右上角的`Artifacts`按钮下载二进制文件。

## 鸣谢
- [Actions-OtakuWrt](https://github.com/F-T-Otaku/Actions-OtakuWrt)
- [ImmortalWrt](https://github.com/immortalwrt/immortalwrt)
- [P3TERX's Actions](https://github.com/P3TERX/Actions-OpenWrt)
- [GitHub Actions](https://github.com/features/actions)
- [QiuSimons's YAOF](https://github.com/QiuSimons/YAOF)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
