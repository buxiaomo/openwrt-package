# openwrt-package

```
echo "src-git buxiaomo https://github.com/buxiaomo/openwrt-package.git" >> feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
```

## add repo
```
git submodule add --force --name luci-app-apcupsd https://github.com/buxiaomo/luci-app-apcupsd.git  luci/applications/luci-app-apcupsd


git rm -rf luci/applications/luci-app-smartdns
git rm -r --cached luci-app-smartdns
```
git submodule add --force --name smartdns https://github.com/pymumu/openwrt-smartdns.git packages/smartdns  