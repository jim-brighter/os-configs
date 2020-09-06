#!/bin/bash

set -ex

if [ ! -f ~/.ssh/id_rsa ]; then
    echo "ssh id_rsa file doesn't exist, exiting now!"
    exit 1
fi

flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.slack.Slack
flatpak install -y flathub com.nordpass.NordPass

source /usr/share/nvm/init-nvm.sh
nvm install 12

git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"

curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/git-clone.sh
bash ./git-clone.sh

cp ~/github/jim-brighter/os-configs/arch/vimrc.bak ~/.vimrc
cp ~/github/jim-brighter/os-configs/arch/zshenv.bak ~/.zshenv
cat ~/github/jim-brighter/os-configs/arch/zshrc.bak >> ~/.zshrc

if [ -f ~/.config/picom/picom.conf ]; then
    cp ~/github/jim-brighter/os-configs/arch/config/i3/config ~/.config/i3/config
    cp ~/github/jim-brighter/os-configs/arch/config/i3status/config ~/.config/i3status/config
    cp ~/github/jim-brighter/os-configs/arch/config/termite/config ~/.config/termite/config

    mkdir -p ~/.local/bin
    cp ~/github/jim-brighter/os-configs/arch/ctl ~/.local/bin
fi

cd
neofetch
