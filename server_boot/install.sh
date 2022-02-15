#!/bin/bash

# 更新apt
apt update

# 检测git 是否安装
if !command -v git >/dev/null 2>&1; then
    apt install -y git
fi

mkdir -p /data/script

# 创建server_boot目录
git clone http://git.iliuyt.com/liuyt/script.git /data/script

cd /data/script

sh  /data/script/server_boot/install_boot.sh
