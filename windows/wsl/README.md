## Install Arch WSL
- from Ubuntu (or another WSL distro):
```bash
mkdir tmp && cd tmp
curl -L http://mirror.umd.edu/archlinux/iso/latest/archlinux-bootstrap-2021.02.01-x86_64.tar.gz -o archlinux-bootstrap.tar.gz
sudo tar -xzf archlinux-bootstrap.tar.gz
cd root.x86_64
sudo tar -czf ArchWSL.tar.gz .
sudo cp ArchWSL.tar.gz /mnt/c/Users/jimbr
```
- from powershell:
```powershell
mkdir C:\Users\jimbr\ArchWSL
wsl --import Arch C:\Users\jimbr\ArchWSL C:\Users\jimbr\ArchWSL.tar.gz
```
- Start Arch: `wsl -d Arch`
```bash
pacman-key --init
pacman-key --populate archlinux
curl -o rankmirrors.sh https://git.archlinux.org/pacman-contrib.git/plain/src/rankmirrors.sh.in
chmod +x rankmirrors.sh
curl -s "https://www.archlinux.org/mirrorlist/?country=US&protocol=https&ip_version=4" | cut -b 2- | ./rankmirrors.sh -n 10 - > /etc/pacman.d/mirrorlist
pacman -Syyu
pacman -S base base-devel vi vim
sed -i -e 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
passwd
touch /etc/wsl.conf
echo "[user]" >> /etc/wsl.conf
echo "default = jim" >> /etc/wsl.conf
useradd -m -G wheel jim
passwd jim
visudo
```
- Logout Windows for the default user to take effect
- Windows Terminal will automatically pickup the Arch distro and give it a new profile, so just modify that
- Setup Arch
