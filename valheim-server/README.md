# Valheim Server
## As root
```bash
getconf PAGESIZE; # verify 16k
nano /boot/firmware/config.txt; # add to top of file: kernel=kernel8.img

reboot now;

getconf PAGESIZE; # verify 4k

dpkg --add-architecture armhf && apt-get update;

nano /etc/ssh/sshd_config; # turn off password auth
systemctl restart ssh;

apt update \
&& apt full-upgrade -y \
&& apt install -y vim git ufw unattended-upgrades apt-listchanges bsd-mailx \
build-essential cmake gcc-arm-linux-gnueabihf libc6:armhf;

ufw enable;
ufw default deny;
ufw allow from 192.168.1.0/24 to any port 22 proto tcp;
ufw allow from 0.0.0.0/0 to any port 2456 proto udp;
ufw status verbose;

dpkg-reconfigure -plow unattended-upgrades; # turn on automatic upgrades
vim /etc/apt/apt.conf.d/50unattended-upgrades; # configure upgrades
cat /etc/apt/apt.conf.d/20auto-upgrades; # verify enabled
systemctl list-timers apt-daily*; # verify timers
dpkg-reconfigure exim4-config; # setup SMTP server
```

## As vhserver
### box86
```bash
git clone https://github.com/ptitSeb/box86;
cd ~/box86;
mkdir build;
cd build;
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo;
make -j$(nproc);
sudo make install;
sudo systemctl restart systemd-binfmt;
```

### box64
```bash
git clone https://github.com/ptitSeb/box64.git;
cd ~/box64;
mkdir build;
cd build;
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo;
make -j$(nproc);
sudo make install;
sudo systemctl restart systemd-binfmt;
```

### SteamCMD
```bash
mkdir ~/steamcmd;
cd ~/steamcmd;
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -;
./steamcmd.sh; # verify it works, then quit
```

### Valheim Server
```bash
cd ~/steamcmd;
./steamcmd.sh +force_install_dir ~/valheim_server +@sSteamCmdForcePlatformType linux +login anonymous +app_update 896660 validate +quit;
```

### Service
Move `valheim.service` file to `~/.config/systemd/user/`, then:
```bash
systemctl --user enable valheim;
systemctl --user start valheim;
systemctl --user status valheim;
```

May need to add below to `~/.profile`:
```bash
export XDG_RUNTIME_DIR="/run/user/$UID"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
```

### Other
Setup crontab for backups and updates

_Based on instructions from https://pimylifeup.com/raspberry-pi-valheim-server/_
