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
- Copy `SF Mono` font files out of Terminal.app into Font Book
- For Powerlevel9k, set theme to `powerlevel9k/powerlevel9k` and source `.powerlevel9k.sh` in .zshrc, and then set fonts to `MesloLGM Nerd Font Mono`:
- To patch SF Mono with Nerd Fonts:
  1. Clone the nerd-fonts github repo
  1. Copy the SF Mono .otf files into a folder `SF-Mono` within nerd-fonts folder
  1. Make a directory `SF-Mono-Patched` within nerd-fonts folder
  1. Follow instructions to install fontforge on nerd-fonts repo
  1. Run below shell script to patch all font files (may need to be run with `bash` instead of `zsh`
  ```bash
  for font in $(ls -1 ./SF-Mono); do
    fontforge -script font-patcher -c ./SF-Mono/"$font" -out ./SF-Mono-Patched;
  done
  ```
  1. Copy patched font files into Font Book
