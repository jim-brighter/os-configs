#!/bin/bash

set -ex

if [ ! -f ~/.ssh/id_rsa ]; then
    echo "ssh id_rsa file doesn't exist, exiting now!"
    exit 1
fi

sudo pacman -S git

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ~
yay -Syu \
gcc \
jdk11-openjdk \
gradle \
eclipse-common \
eclipse-jee \
zip \
unzip \
nerd-fonts-complete \
zsh \
nvm \
aws-cli-v2 \
openssh \
noto-fonts \
noto-fonts-cjk \
noto-fonts-emoji \
htop \
go \
jq

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

chsh -s /usr/bin/zsh

source /usr/share/nvm/init-nvm.sh
nvm install 14

git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"

curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/git-clone.sh
source ./git-clone.sh
cloneAllRepos

cp ~/github/jim-brighter/os-configs/windows/wsl/vimrc.bak ~/.vimrc
cp ~/github/jim-brighter/os-configs/windows/wsl/zshenv.bak ~/.zshenv
cat ~/github/jim-brighter/os-configs/windows/wsl/zshrc.bak >> ~/.zshrc

cd
clear
