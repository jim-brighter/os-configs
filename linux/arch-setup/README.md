## Pacstrap
```bash
pacstap /mnt base base-devel networkmanager vim curl
```

## arch-chroot
```bash
systemctl enable NetworkManager
```

## First Boot
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/linux/arch-setup/1-init.sh
chmod +x 1-init.sh
./1-init.sh
rm 1-init.sh
reboot now
```

## First Login
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/linux/arch-setup/2-setup.sh
chmod +x 2-setup.sh
./2-setup.sh
rm 2-setup.sh
reboot now
```

## Long Builders...
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/linux/arch-setup/3-setup.sh
chmod +x 3-setup.sh
./3-setup.sh
rm 3-setup.sh
```
