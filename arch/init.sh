#!/bin/bash

set -ex

read -p "kde or i3? " desktop

# for dual-booting with windows
sudo timedatectl set-local-rtc 1 --adjust-system-clock

sudo pacman -S git

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ~
yay -Syu \
nvidia \
xorg \
firefox \
chromium \
gcc \
jdk11-openjdk \
gradle \
eclipse-common \
eclipse-jee \
docker \
docker-compose \
code \
neofetch \
zip \
unzip \
snapd \
nerd-fonts-complete \
zsh \
nvm \
aws-cli-v2 \
openssh \
noto-fonts \
noto-fonts-cjk \
noto-fonts-emoji \
htop \
pulseaudio \
pulseaudio-alsa \
slack-desktop

if [ "$desktop" = "kde" ]; then

    yay -S \
    plasma \
    kde-applications \
    sddm \
    sddm-kcm \
    latte-dock \
    extra-cmake-modules \
    plasma-framework \
    gettext \
    kdecoration \
    appmenu-gtk-module \
    libdbusmenu-glib

    sudo systemctl enable sddm

else

    yay -S \
    lightdm \
    lightdm-gtk-greeter \
    i3 \
    termite \
    dmenu \
    feh \
    picom \
    lxappearance

    sudo systemctl enable lightdm

    mkdir -p ~/.config/termite
    mkdir -p ~/.config/picom
    mkdir -p ~/.config/i3status

    cp /etc/xdg/termite/config ~/.config/termite/config
    cp /etc/xdg/picom.conf ~/.config/picom/picom.conf
    cp /etc/i3status.conf ~/.config/i3status/config

fi

sudo systemctl enable docker
sudo systemctl enable snapd
sudo systemctl enable snapd.socket

sudo gpasswd -a jim docker
sudo ln -s /var/lib/snapd/snap /snap

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc

chsh -s /usr/bin/zsh

echo "if everything looks good, reboot now"
