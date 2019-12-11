#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install \
    doctl \
    git \
    gradle \
    neofetch \
    node@12 \
    openjdk@11 \
    python

brew tap caskroom/cask
brew cask install \
    discord \
    docker \
    eclipse-jee \
    firefox \
    google-backup-and-sync \
    google-chrome \
    iterm2 \
    nordvpn \
    qbittorrent \
    slack \
    spotify \
    steam \
    sublime-text \
    visual-studio-code \
    vlc

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

pip3 install awscli --upgrade

clear
neofetch
