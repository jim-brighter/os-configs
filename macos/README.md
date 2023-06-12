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

## Patch SF Mono with Nerd Fonts:
- Clone the nerd-fonts github repo
- Copy the SF Mono .otf files into a folder `SF-Mono` within nerd-fonts folder
- Make a directory `SF-Mono-Patched` within nerd-fonts folder
- Follow instructions from nerd-fonts to install fontforge
- Run below shell script to patch all font files (run with `bash` instead of `zsh`)
  ```bash
  for font in $(ls -1 ./SF-Mono); do
    fontforge -script font-patcher -c -s ./SF-Mono/"$font" -out ./SF-Mono-Patched;
  done
  ```
