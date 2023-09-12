# Actions-LEDE

Build OpenWrt for X86/R5S using GitHub Actions.

**r5s version is very aggressive.(By using master branch of immortalwrt)**

**Please make sure you can accept various unexpected situations such as disconnection and crash before use.**

## Tips

- Default login address is [192.168.50.1](192.168.50.1)
- Default username is **root** and password is **password**.(Universal for all versions)
- This version of OpenWrt is very simple.lt has only a small part of luci's apps.
- If you want more applications, fork my repo and make your own version.
- Or, you can use the action with **ssh** to make your own version.

## Want to build your own version?

- Click the Fork button to create a new repository.
- Generate `.config` files using [LEDE](https://github.com/coolsnowwolf/lede) (for x86 and acrh17) or [ImmortalWrt](https://github.com/immortalwrt/immortalwrt/tree/master) (for others) source code. 
- You can change source code through environment variables in the workflow file. [**Tutorials**](https://p3terx.com/archives/build-openwrt-with-github-actions.html)
- Add your own `seed.config` to `SEED` folder. [**Tutorials**](https://github.com/coolsnowwolf/lede/issues/2288)
- Select `Build OpenWrt` on the Actions page.
- Click the `Run workflow` button.
- When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.

## Acknowledgments

- [ImmortalWrt](https://github.com/immortalwrt/immortalwrt)
- [P3TERX's Actions](https://github.com/P3TERX/Actions-OpenWrt)
- [GitHub Actions](https://github.com/features/actions)
- [QiuSimons's YAOF](https://github.com/QiuSimons/YAOF)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
