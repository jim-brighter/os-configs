## MacOS Setup Instructions
- Follow MacOS Installer until you get to the Desktop
- Install all available MacOS updates
- Install BetterSnapTool and any updates from the App Store
- Download ssh key from Google Drive and untar it into home directory
  - `chmod` the file appropriately
- Download the setup script from this folder
```bash
curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/init.sh
chmod +x init.sh
```
- Run the setup script
```bash
bash init.sh
```
- For Powerlevel9k, set variables in .zshrc and then set fonts to `MesloLGM Nerd Font Mono`:
```bash
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_SHORTEN_DIR_LENGTH="1"
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
```

- For robbyrussell, don't need to change any variables, just copy `SF Mono` font files out of Terminal.app into Font Book
