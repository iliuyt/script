#!/bin/bash

# 更改apt源
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp ~/.lyt_script/lyt_script/ubuntu/20.04/source.list /etc/apt/sources.list

# 更新apt
apt update

# 检测vim 是否安装
if !command -v vim >/dev/null 2>&1; then
    apt install -y vim
fi

# 检测curl 是否安装
if !command -v curl >/dev/null 2>&1; then
    apt install -y curl
fi

# 安装zsh
apt install -y zsh
chsh -s /bin/zsh

# ohmyzsh 安装
sh ./lib/ohmyzsh/install.sh
# 自动补全插件
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestion
sed -i '/plugins=(git)/ a\plugins=(zsh-autosuggestions)' ~/.zshr
# 主机名修改
cp ~/.oh-my-zsh/themes/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/myrobbyrussell.zsh-theme
sed -i 's/➜/>>>/g' ~/.oh-my-zsh/themes/myrobbyrussell.zsh-them
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="myrobbyrussell"/g' ~/.zshr
# docker 自定义快捷命令安装
mv ./lib/docker/.dkrc ~/.dkr
echo '. ~/.dkrc' >>~/.zshr
source ~/.zshr
# docker 安装
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyu
# 设置docker0地址
mv ./lib/docker/daemon.json /etc/docker/
# docker-compose 安装
curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compos
chmod +x /usr/local/bin/docker-compose

# 创建文件夹
mkdir -p /data


echo "install success"
