## Windows 10 Setup Instructions
- Follow Windows installer until you get to the Desktop
- Install all available Windows updates
- Install drivers for chipset, storage, sound, graphics, and networking as needed
    - Install ASUS Armoury Crate software suite on desktop
    - Install NZXT CAM software on desktop
- Install upgrade to Windows 10 Pro
- Install any new Windows updates
- Install Spotify from Windows Store
    - Also a good time to remove bloatware and games
- Download the setup script from this folder
```powershell
Invoke-RestMethod `
  -Uri https://raw.githubusercontent.com/jim-brighter/os-configs/master/windows/windows-init.ps1 `
  -OutFile ~/Downloads/windows-init.ps1
```
- Make sure Powershell is configured to enable running scripts (in an admin powershell window)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```
- Open a new admin powershell window, and run
```powershell
.\windows-init.ps1
```
- Reboot
- Configure installed apps
