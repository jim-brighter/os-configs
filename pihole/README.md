# Quick Start

First, setup timezone and ssh config in Raspberry Pi Imager when imaging the SD card.

Then ssh into the Pi and run the below:
```bash
sudo su

apt update && \
apt full-upgrade -y && \
apt install -y vim git ufw unattended-upgrades apt-listchanges bsd-mailx;

ufw enable;
ufw default deny;
ufw allow from 192.168.1.0/24 to any port 22 proto tcp;
ufw allow from 192.168.1.0/24 to any port 80 proto tcp;
ufw allow from 192.168.1.0/24 to any port 443 proto tcp;
ufw allow from 192.168.1.0/24 to any port 53 proto tcp;
ufw allow from 192.168.1.0/24 to any port 53 proto udp;
ufw status verbose;
# verify firewall rules

dpkg-reconfigure -plow unattended-upgrades;
# 1. edit /etc/apt/apt.conf.d/50unattended-upgrades and /etc/apt/apt.conf.d/20auto-upgrades to setup auto updates
# 2. add "origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation"; to the Origins-Pattern section

systemctl list-timers apt-daily*;
# verify timers for auto-upgrades are set

dpkg-reconfigure exim4-config;
# configure smtp server for emails

curl -sSL https://install.pi-hole.net | bash

crontab -e
# 5 6 * * * /opt/pihole-update.sh
```
