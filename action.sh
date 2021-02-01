#!/bin/bash
set -x
function v2ray() {
    export tag_name=$(curl -s -k -f --connect-timeout 20 --retry 5 --location --insecure https://api.github.com/repos/v2fly/v2ray-core/releases/latest | jq -r .tag_name)
    grep "${tag_name:1}" ./packages/v2ray-core/Makefile
    if [ $? -ne  0 ];then
        sed -i "11s/PKG_VERSION.*/PKG_VERSION:=${tag_name:1}/" ./packages/v2ray-core/Makefile
        wget https://codeload.github.com/v2fly/v2ray-core/tar.gz/v${tag_name:1} -O v2ray.src.tar.gz
        shasum=$(sha256sum v2ray.src.tar.gz | awk '{print $1}')
        sed -i "s/PKG_HASH.*/PKG_HASH:=${shasum}/g" ./packages/v2ray-core/Makefile
        rm -rf v2ray.src.tar.gz
        git config --local user.email "action@github.com"
        git config --local user.name "GitHub Action"
        git add ./packages/v2ray-core/Makefile
        git commit -am "update version to ${tag_name}"
        git push
    fi
}

$@