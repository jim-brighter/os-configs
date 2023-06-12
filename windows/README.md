## Windows 10 Setup Instructions
- Follow Windows installer until you get to the Desktop
- Install all available Windows updates
- Install drivers for chipset, network, audio, and graphics
- Install Spotify, Netflix, Hulu, Amazon Prime Video, Disney+, Auto Dark Mode, and Messenger from Windows Store
    - Also a good time to remove bloatware and games
- Install non-development software:
    - ASUS Armoury Crate
    - NZXT CAM
    - Ryzen Master
    - Logitech G Hub
    - Brother Drivers
    - Oculus
    - Battle.net
    - Discord
    - Epic Games Launcher
    - Ubisoft Connect
    - Google Chrome
    - NordPass
    - NordVPN
    - Origin
    - Steam
    - OBS
- Install development software
    - [Install WSL 2](https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps)
    - Sublime Text
    - Intellij Community
    - Postman
    - Visual Studio Code
    - Docker Desktop
- Install within WSL:
    - Git
    - Github CLI
    - Temurin 17
    - AWS CLI
    - JQ
    - Helm
    - Nodejs
    - Python
- Small configs:
  - create new ssh keys for personal & work github accounts, get new tokens
  - setup git-clone and gitconfig from this repo
  - configure aws cli
  - run git clone script

---

### Fixing Weird Internet Issues
- Disable IPv6 in ethernet adapter properties

### Fixing Slow Performance in IntelliJ in WSL
- Add exclusions to Windows Security:
    - \\wsl$\Ubuntu
    - \\wsl.localhost\Ubuntu
    - C:\Program Files\JetBrains
    - %LOCALAPPDATA%\JetBrains
    - %APPDATA%\JetBrains

### Fixing the Sleep after 2 Minutes Bug
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
