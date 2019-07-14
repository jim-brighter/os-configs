#!/bin/bash
set -ex
sudo pacman-mirrors -c United_States
sudo pacman-key --refresh-keys
sudo pacman -Syu
sudo pacman -S virtualbox-guest-utils
sudo systemctl start vboxservice
sudo systemctl enable vboxservice
sudo chmod o+rx /media
sudo gpasswd -a jim vboxsf
sudo pacman -S firefox gradle eclipse-jee emacs-nox docker docker-compose dbeaver git nodejs npm openssh libxss gconf code ttf-hack
sudo systemctl enable docker
sudo gpasswd -a jim docker
