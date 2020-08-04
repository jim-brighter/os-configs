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
