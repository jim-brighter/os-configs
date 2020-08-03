#!/bin/bash

set -ex

if [ ! -f ~/.ssh/id_rsa ]; then
    echo "ssh id_rsa file doesn't exist, exiting now!"
    exit 1
fi

sudo snap install spotify
sudo snap install slack --classic

source /usr/share/nvm/init-nvm.sh
nvm install 12

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
git clone git@github.com:jim-brighter/pi-dashboard.git
git clone git@github.com:jim-brighter/pihole.git

cd ~/projects/resume-sleuth
git clone git@github.com:natehand93/resume-sleuth-resume-service.git
git clone git@github.com:natehand93/resume-sleuth-ui.git

cd ~/projects/skyhook
git clone git@github.com:skyhook-cli/skyhook-cli.git
git clone git@github.com:skyhook-cli/skyhook-templates.git


read -p "Use latte-dock [y/N]? " latte

if [ "$latte" = "y" ]; then
	echo "Installing latte-dock + some cool stuff to go with it"

    yay -Syu \
    latte-dock \
    extra-cmake-modules \
    plasma-framework \
    gettext \
    kdecoration

    # https://github.com/psifidotos/applet-window-buttons
    mkdir ~/applets
    cd ~/applets
    git clone https://github.com/psifidotos/applet-window-buttons.git
    cd applet-window-buttons/
    sh install.sh

    # https://github.com/psifidotos/Latte-Dock/wiki/F.A.Q.#q-can-i-use-my-super-key-to-open-the-app-launcher
    kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.lattedock,/Latte,org.kde.LatteDock,activateLauncherMenu"
    qdbus org.kde.KWin /KWin reconfigure

else
	echo "Skipping latte-dock install"
fi
