#!/bin/sh
set -ex
pacman -S firefox gradle eclipse-jee emacs-nox \
	docker docker-compose dbeaver git nodejs npm openssh \
	libxss gconf code ttf-hack neofetch gtop zip unzip vim \
	appmenu-gtk-module libdbusmenu-glib

systemctl enable docker

gpasswd -a jim docker
