# openwrt-package

```
echo "src-git buxiaomo https://github.com/buxiaomo/openwrt-package.git" >> feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
```

## add repo
```
git submodule add --force --name luci-app-apcupsd https://github.com/buxiaomo/luci-app-apcupsd.git  luci/applications/luci-app-apcupsd


git rm -rf packages/smartdns
git rm -r --cached smartdns
```
git submodule add --force --name smartdns https://github.com/pymumu/openwrt-smartdns.git packages/smartdns  

## submodule
### add 
git submodule add --force --name <name> <url> <path>
### update
cd <path>
git pull
### delete
rm -rf <name>
vim .gitmodules
vim .git/config
rm -rf .git/module/<name>
git rm --cached <name>