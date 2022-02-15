#!/bin/bash

# 更改apt源
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp /data/script/server_boot/lib/ubuntu/20.04/source.list /etc/apt/sources.list

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
sh /data/script/server_boot/lib/ohmyzsh/install.sh -y
# 自动补全插件
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i '/plugins=(git)/ a\plugins=(zsh-autosuggestions)' ~/.zshrc
# 主机名修改
cp ~/.oh-my-zsh/themes/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/myrobbyrussell.zsh-theme
sed -i 's/➜/>>>/g' ~/.oh-my-zsh/themes/myrobbyrussell.zsh-theme
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="myrobbyrussell"/g' ~/.zshrc
# docker 自定义快捷命令安装
cp /data/script/server_boot/lib/docker/.dkrc ~/.dkrc
echo '. ~/.dkrc' >>~/.zshrc
source ~/.zshrc
# docker 安装
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyu
# 设置docker0地址
mv /data/script/server_boot/lib/docker/daemon.json /etc/docker/
# docker-compose 安装
curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compos
chmod +x /usr/local/bin/docker-compose

echo "install success"
