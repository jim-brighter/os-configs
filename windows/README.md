## Windows 10 Setup Instructions
- Follow Windows installer until you get to the Desktop
- Install all available Windows updates
- Install drivers for chipset, storage, sound, graphics, and networking as needed
    - Desktop:
        - ASUS Armoury Crate software suite
        - NZXT CAM software
        - Logitech G Suite
        - Ryzen Master
        - Brother Drivers
        - Oculus
- Install upgrade to Windows 10 Pro
- Install any new Windows updates
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
- Open Git Bash and execute the below commands to clone all repos
```bash
source ~/git-clone.sh
cloneAllRepos [https]
```
- Reboot
- Install Ubuntu 20.04, Spotify, Windows Terminal, Netflix, Hulu, Amazon Prime Video, and Slack from Windows Store
    - Also any other Linux distros (Debian, OpenSUSE)
    - Also a good time to remove bloatware and games
- Configure installed apps
- Get some cool fonts from Nerd Fonts, or the Consolas Patched from this repo

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
