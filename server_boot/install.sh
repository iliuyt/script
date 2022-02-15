#!/bin/bash

# 更新apt
apt update

# 检测git 是否安装
if !command -v git >/dev/null 2>&1; then
    apt install -y git
fi

# 创建server_boot目录
git clone http://git.iliuyt.com/liuyt/script.git ~/.lyt_script

cd ~/.lyt_script

sh  ~/.lyt_script/server_boot/install_boot.sh
