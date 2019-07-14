## Windows 10 Setup Instructions
- Follow Windows installer until you get to the Desktop
- Install all available Windows updates
- Install drivers for chipset, storage, sound, graphics, and networking as needed
    - Install CAM on desktop
- Install upgrade to Windows 10 Pro
- Install any new Windows updates
- Install Ubuntu and Spotify from Windows Store
    - Also a good time to remove bloatware and games
- Enable WSL and reboot
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```
- Make sure OpenSSH service is running and starts automatically
- Download ssh key from Google Drive and untar it into home directory
- Add ssh key to ssh-agent
- Download the profile and two setup scripts from this folder
    - Move profile to Windows Powershell directory
    - Make sure Powershell is configured to enable running scripts (in an admin powershell window)
    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
    ```
- Open a new admin powershell window, and run
```powershell
.\01-windows-init.ps1
```
- Reboot when finished
- Open a new admin powershell window, and run
```powershell
.\02-windows-setup.ps1
```
- Configure installed apps
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
