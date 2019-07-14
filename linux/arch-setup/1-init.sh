#!/bin/sh
set -ex
pacman -S xorg lightdm lightdm-gtk-greeter i3 virtualbox-guest-utils firefox gradle eclipse-jee emacs-nox \
	docker docker-compose dbeaver git nodejs npm openssh libxss gconf code ttf-hack rxvt-unicode noto-fonts \
	ttf-dejavu lxappearance feh ranger w3m ttf-font-awesome neofetch compton gtop gtk-engine-murrine \
	gtk-engines papirus-icon-theme zip unzip inkscape gnome-themes-standard rofi

systemctl start vboxservice
systemctl enable vboxservice
systemctl enable lightdm
systemctl enable docker

chmod o+rx /media

useradd -m -G wheel jim
passwd jim
visudo

gpasswd -a jim vboxsf
gpasswd -a jim docker
