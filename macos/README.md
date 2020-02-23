## MacOS Setup Instructions
- Follow MacOS Installer until you get to the Desktop
- Install all available MacOS updates
- Install BetterSnapTool (optional) and any updates from the App Store
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
- Copy `SF Mono` font files out of Terminal.app into Font Book
- Copy `SF Mono Patched` font files out of this repo into Font Book
- For Powerlevel9k, set theme to `powerlevel9k/powerlevel9k` and source `.powerlevel9k.sh` in `.zshrc`, and then set fonts to either `MesloLGM Nerd Font Mono` or `SFMono NF`

## Patch SF Mono with Nerd Fonts:
- Clone the nerd-fonts github repo
- Copy the SF Mono .otf files into a folder `SF-Mono` within nerd-fonts folder
- Make a directory `SF-Mono-Patched` within nerd-fonts folder
- Follow instructions from nerd-fonts to install fontforge
- Run below shell script to patch all font files (run with `bash` instead of `zsh`)
  ```bash
  for font in $(ls -1 ./SF-Mono); do
    fontforge -script font-patcher -c ./SF-Mono/"$font" -out ./SF-Mono-Patched;
  done
  ```
