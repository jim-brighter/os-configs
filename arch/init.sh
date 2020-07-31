#!/bin/bash

set -ex

sudo timedatectl set-local-rtc 1 --adjust-system-clock

sudo pacman -S git

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Syu \
nvidia \
xorg \
plasma \
kde-applications \
latte-dock \
sddm \
sddm-kcm \
firefox \
chromium \
gcc \
extra-cmake-modules \
plasma-framework \
gettext kdecoration \
jdk11-openjdk \
gradle \
eclipse-common \
eclipse-jee \
docker \
docker-compose \
code \
neofetch \
gtop \
zip \
unzip \
appmenu-gtk-module \
libdbusmenu-glib \
snapd \
nerd-fonts-source-code-pro \
zsh \
nvm \
aws-cli-v2

echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc

sudo systemctl enable --now snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sudo systemctl enable sddm
sudo systemctl enable docker

sudo gpasswd -a jim docker

echo "if everything looks good, reboot now"
