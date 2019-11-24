#!/bin/sh
set -ex
pacman -S firefox gradle eclipse-jee emacs-nox \
	docker docker-compose dbeaver git nodejs npm openssh \
	libxss gconf code ttf-hack neofetch gtop zip unzip vim \
	appmenu-gtk-module libdbusmenu-glib latte-dock snapd

systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap

snap install slack --classic
snap install spotify

systemctl enable docker

gpasswd -a jim docker
