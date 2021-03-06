## MacOS Setup Instructions
- Follow MacOS Installer until you get to the Desktop
- Install all available MacOS updates
- Install BetterSnapTool and maybe Microsoft Office/OneDrive and any updates from the App Store
- Install NordPass from its website since it's not in homebrew
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
- Copy `SF Mono Patched` font files out of this repo into Font Book
- For Powerlevel10k, set theme to `powerlevel10k/powerlevel10k` and then set terminal fonts to either `MesloLGM Nerd Font Mono` or `SFMono NF` or `CaskaydiaCove Nerd Font Mono`

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
