# Manjaro Setup
These scripts configure a Manjaro installation on bare metal - designed with KDE in mind

## First Boot
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/linux/manjaro-setup/1-init.sh
chmod +x 1-init.sh
./1-init.sh
rm 1-init.sh
reboot now
```

## First Login
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/linux/manjaro-setup/2-setup.sh
chmod +x 2-setup.sh
./2-setup.sh
rm 2-setup.sh
reboot now
```