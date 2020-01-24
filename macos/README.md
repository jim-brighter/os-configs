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

POWERLEVEL9K_OS_ICON_FOREGROUND="gold1"
POWERLEVEL9K_OS_ICON_BACKGROUND="black1"

POWERLEVEL9K_DIR_HOME_FOREGROUND="cyan1"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="cyan1"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="cyan1"
POWERLEVEL9K_DIR_ETC_FOREGROUND="cyan1"
POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND="cyan1"
POWERLEVEL9K_DIR_HOME_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="black"
POWERLEVEL9K_DIR_ETC_BACKGROUND="black"
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND="black"

POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green1"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow1"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow1"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="black"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="black"

POWERLEVEL9K_STATUS_OK_FOREGROUND="black"
POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_COLOR="green1"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red1"
POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_COLOR="red1"
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"

POWERLEVEL9K_CARRIAGE_RETURN_ICON=""

POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="magenta1"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="black"

POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS="  "
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS="  "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir_joined vcs_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator_joined background_jobs_joined)
```

- For robbyrussell, don't need to change any variables, just copy `SF Mono` font files out of Terminal.app into Font Book
