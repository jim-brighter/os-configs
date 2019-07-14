#!/bin/bash
set -ex
docker login
cd ~
sudo mount -t vboxsf vm-shared /media/sf_vm-shared
cp /media/sf_vm-shared/*ssh.tar.gz ./ssh.tar.gz
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

cd os-configs/linux
cp .bashrc ~/.bashrc
cp .emacs ~/.emacs
cp .exrc ~/.exrc

mkdir ~/Pictures
cp wallpaper.jpg ~/Pictures/wallpaper.jpg

cp .Xresources ~/.Xresources
cp .config/i3/config ~/.config/i3/config
cp .config/compton/compton.config ~/.config/compton/compton.config
cp .config/rofi/theme.rofi ~/.config/rofi/theme.rofi

sudo cp etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

cd ~
curl -LO https://github.com/vinceliuice/matcha/archive/master.zip
unzip -q master.zip
rm master.zip
cd matcha-master
chmod +x Install
./Install

cd ~
curl -LO https://github.com/KaizIqbal/Bibata_Cursor/archive/master.zip
unzip -q master.zip
rm master.zip
cd Bibata_Cursor-master
chmod +x build.sh
./build.sh
chmod +x ./Installer_Bibata.sh
./Installer_Bibata.sh
