# Quick Start
```bash
sudo dpkg-reconfigure console-setup
# 1. Change font size

sudo apt update && sudo apt full-upgrade -y \
&& sudo apt install -y vim git ufw unattended-upgrades apt-listchanges bsd-mailx

sudo ufw enable;
sudo ufw default deny;
sudo ufw allow from 192.168.1.0/24 to any port 22 proto tcp;

sudo raspi-config
# 1. Change Localization Options
# 2. Enable ssh server in Interfacing Options
# 3. Disable auto-login
# 4. Logout and connect via ssh for the rest of the setup

sudo dpkg-reconfigure -plow unattended-upgrades
# 1. edit /etc/apt/apt.conf.d/50unattended-upgrades and /etc/apt/apt.conf.d/20auto-upgrades to setup auto updates
# 2. add "origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation"; to the Origins-Pattern section

sudo dpkg-reconfigure exim4-config
# 1. configure smtp server for emails

sudo systemctl edit apt-daily.timer
sudo systemctl edit apt-daily-upgrade.timer
# 1. set timers to sensible values

sudo systemctl list-timers apt-daily*
# verify timers

sudo ufw allow from 192.168.1.0/24 to any port 80 proto tcp;
sudo ufw allow from 192.168.1.0/24 to any port 53 proto tcp;
sudo ufw allow from 192.168.1.0/24 to any port 53 proto udp;
sudo ufw status verbose;
# 1. verify rules

# Switch to root user for pihole install
sudo su
curl -sSL https://install.pi-hole.net | bash
```
