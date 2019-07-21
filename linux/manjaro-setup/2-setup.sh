#!/bin/bash
set -ex
docker login
cd ~
cp ~/Downloads/*ssh.tar.gz ./ssh.tar.gz
tar -zxf ssh.tar.gz
rm ssh.tar.gz
chmod 700 .ssh/*
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
mkdir -p projects/personal
cd projects/personal
git clone git@github.com:jim-brighter/planner.git
git clone git@github.com:jim-brighter/jenkins.git
git clone git@github.com:jim-brighter/photodump.git
git clone git@github.com:jim-brighter/os-configs.git
git clone git@github.com:jim-brighter/jim-brighter.github.io.git
git clone git@github.com:jim-brighter/ops-secrets.git
git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"

cd os-configs/linux/config-files
cat .bashrc >> ~/.bashrc
cp .emacs ~/.emacs
cp .exrc ~/.exrc
cp .config/kwinrc ~/.config/kwinrc
