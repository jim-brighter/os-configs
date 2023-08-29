## MacOS Setup Instructions
- Follow MacOS Installer until you get to the Desktop
- Install all available MacOS updates
- Install any updates from the App Store
- Install xcode command line tools:
```bash
xcode-select --install
```
- Install [homebrew](https://brew.sh)
- Install homebrew software
```bash
brew install argocd awscli doctl git gradle helm jq maven node@18 temurin17
```
- Install non-homebrew software:
  - Discord
  - Docker Desktop
  - Github CLI
  - Google Chrome
  - Intellij Idea CE
  - iTerm
  - Messenger
  - NordVPN
  - NordPass
  - Postman
  - Slack
  - Spotify
  - Steam
  - Sublime Text
  - Raspberry Pi Imager
  - Rectangle Pro
  - Visual Studio Code
  - Zoom
- Install [Oh My Zsh](https://ohmyz.sh/#install) and [Powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
- Small configs:
  - create new ssh keys for personal & work github accounts, get new tokens
  - setup git-clone and gitconfig from this repo
  - configure aws cli
  - run git clone script

### HoMM3 Setup
1. Install Wineskin via homebrew (https://github.com/Gcenx/WineskinServer)
1. Create a new wrapper with the "normal" (non-D3DMetal) engine
1. Install HoMM3 complete from GOG in the wrapper
1. Install HD Mod in the wrapper
1. Install HotA in the wrapper
1. Set the Windows EXE to HD_Launcher.exe and then ultimately `Heroes3 HD.exe`
