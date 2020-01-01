## MacOS Setup Instructions
- Follow MacOS Installer until you get to the Desktop
- Install all available MacOS updates
- Install BetterSnapTool from the App Store
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
