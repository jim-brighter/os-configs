#!/bin/bash

set -ex

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
plasma \
kde-applications \
sddm \
sddm-kcm \
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
appmenu-gtk-module \
libdbusmenu-glib \
snapd \
nerd-fonts-complete \
zsh \
nvm

# I don't know why this one behaves differently
yay -S aws-cli-v2

sudo systemctl enable sddm
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
