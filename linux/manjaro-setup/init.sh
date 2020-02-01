#!/bin/bash
set -ex

sudo pacman-mirrors -c United_States

sudo pacman -Syu && sudo pacman-key --refresh-keys

sudo pacman -S \
    jdk11-openjdk \
    gradle \
    eclipse-jee \
    docker \
    docker-compose \
    dbeaver \
    git \
    nodejs \
    npm \
    openssh \
    libxss \
    gconf \
    code \
    neofetch \
    gtop \
    zip \
    unzip \
    vim \
    appmenu-gtk-module \
    libdbusmenu-glib \
    latte-dock \
    yay

systemctl enable docker
gpasswd -a jim docker

yay -S \
    spotify \
    slack-desktop \
    doctl \
    nerd-fonts-meslo

cd ~/Downloads
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/bash_profile.bak
curl -L https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/vimrc.bak -o ~/.vimrc
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/zshenv.bak
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/zshrc.bak

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"

mkdir -p ~/projects/personal
mkdir -p ~/projects/resume-sleuth
mkdir -p ~/projects/skyhook

cd ~/projects/personal
git clone git@github.com:jim-brighter/planner.git
git clone git@github.com:jim-brighter/photodump.git
git clone git@github.com:jim-brighter/jenkins.git
git clone git@github.com:jim-brighter/jim-brighter.github.io.git
git clone git@github.com:jim-brighter/ops-secrets.git
git clone git@github.com:jim-brighter/os-configs.git

cd ~/projects/resume-sleuth
git clone git@github.com:natehand93/resume-sleuth-resume-service.git
git clone git@github.com:natehand93/resume-sleuth-ui.git

cd ~/projects/skyhook
git clone git@github.com:skyhook-cli/skyhook-cli.git
git clone git@github.com:skyhook-cli/skyhook-templates.git
git clone git@github.com:skyhook-cli/sampleapp.git

cd

clear && neofetch
