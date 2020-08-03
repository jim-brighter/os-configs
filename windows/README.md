## Windows 10 Setup Instructions
- Follow Windows installer until you get to the Desktop
- Install all available Windows updates
- Install drivers for chipset, storage, sound, graphics, and networking as needed
    - Install ASUS Armoury Crate software suite on desktop
- Install upgrade to Windows 10 Pro
- Install any new Windows updates
- Install Ubuntu 20.04, Spotify, Windows Terminal, and Slack from Windows Store
    - Also any other Linux distros (Debian, OpenSUSE)
    - Also a good time to remove bloatware and games
- Enable WSL and reboot
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```
----
- Make sure v2 is the default WSL version (will need to install the linux kernel):
```powershell
wsl --set-default-version 2
```
- Make sure OpenSSH service is running and starts automatically
- Download ssh key from Google Drive and untar it into home directory
- Add ssh key to ssh-agent
- Download the profile and two setup scripts from this folder
```powershell
Invoke-RestMethod `
  -Uri https://raw.githubusercontent.com/jim-brighter/os-configs/master/windows/01-windows-init.ps1 `
  -OutFile ~/Downloads/01-windows-init.ps1

Invoke-RestMethod `
  -Uri https://raw.githubusercontent.com/jim-brighter/os-configs/master/windows/02-windows-setup.ps1 `
  -OutFile ~/Downloads/02-windows-setup.ps1

Invoke-RestMethod `
  -Uri https://raw.githubusercontent.com/jim-brighter/os-configs/master/windows/profile.ps1 `
  -OutFile ~/Downloads/profile.ps1
```
- Make sure Powershell is configured to enable running scripts (in an admin powershell window)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
- Move `profile.ps1` to Windows Powershell directory
- Open a new admin powershell window, and run
```powershell
.\01-windows-init.ps1
```
- Open a new admin powershell window, and run
```powershell
.\02-windows-setup.ps1
```
- Reboot
- Configure installed apps
- Get some cool fonts from Nerd Fonts:
  - CaskaydiaCove NF
  - SauceCodePro NF

## Install Arch WSL
- from Ubuntu (or another WSL distro):
```bash
mkdir tmp && cd tmp
curl -LO http://mirror.umd.edu/archlinux/iso/2020.08.01/archlinux-bootstrap-2020.08.01-x86_64.tar.gz
sudo tar -xzf archlinux-bootstrap-2020.08.01-x86_64.tar.gz
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

## Fixing the Sleep after 2 Minutes Bug
- Open the registry and navigate to:
```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0
```
- Open the Attributes DWORD
- Change the value to 2 and click OK
- Open "Power and Sleep" settings
- Go to Additional Power Settings
- Go to Change Plan Settings
- Go to Change Advanced Power Settings
- Go to Sleep > System unattended sleep timeout
- Change value to 0 and Save
