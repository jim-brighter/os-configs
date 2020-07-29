# Installing Arch Linux
Mostly just follow the Arch Install Guide: https://wiki.archlinux.org/index.php/installation_guide but before rebooting:
1. install with recommended pacstrap: `vi vim curl networkmanager`
1. start/enable NetworkManager: `systemctl enable NetworkManager`
1. visudo to allow `wheel` group to sudo
1. add user: `useradd -m -G wheel jim`
1. change pw: `passwd jim`
