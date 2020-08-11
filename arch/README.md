# Installing Arch Linux
Mostly just follow the Arch Install Guide: https://wiki.archlinux.org/index.php/installation_guide but before rebooting:
1. install with recommended pacstrap: `vi vim curl networkmanager systemd-swap`
1. setup swapfile according to installation guide
1. start/enable NetworkManager: `systemctl enable NetworkManager`
1. visudo to allow `wheel` group to sudo
1. add user: `useradd -m -G wheel jim`
1. change pw: `passwd jim`

After rebooting:
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/arch/init.sh
chmod +x init.sh
./init.sh
```

After rebooting again:
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/arch/reboot.sh
chmod +x reboot.sh
./reboot.sh
```

If running kde, then also:
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/arch/kde-extras.sh
chmod +x kde-extras.sh
./kde-extras.sh
```
