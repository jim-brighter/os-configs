## Windows 11 Setup Instructions
- Follow Windows installer until you get to the Desktop
- Install all available Windows updates
- Install drivers for chipset, network, audio, and graphics
- Install Spotify, Netflix, Hulu, Amazon Prime Video, Disney+, Auto Dark Mode, Windows HDR Calibration, and Messenger from Windows Store
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
    - GOG Galaxy
- Install development software
    - [Install WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install)
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
