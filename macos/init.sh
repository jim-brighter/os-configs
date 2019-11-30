#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install openjdk@11 git gradle node@12 python doctl neofetch

brew tap caskroom/cask
brew cask install docker eclipse-jee google-backup-and-sync google-chrome nordvpn visual-studio-code steam sublime-text iterm2 slack spotify

git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"

mkdir -p ~/projects/personal
mkdir -p ~/projects/resume-sleuth
mkdir -p ~/projects/skyhook

cd ~/projects/personal
git clone git@github.com:jim-brighter/planner.git
git clone git@github.com:jim-brighter/photodump.git
git clone git@github.com:jim-brighter/jenkins.git
git clone git@github.com:jim-brighter/jim-brighter.github.io.git
git clone git@github.com:jim-brighter/ops-secrets.git
git clone git@github.com:jim-brighter/os-configs.git

cd ~/projects/resume-sleuth
git clone git@github.com:natehand93/resume-sleuth-resume-service.git
git clone git@github.com:natehand93/resume-sleuth-ui.git

cd ~/projects/skyhook
git clone git@github.com:skyhook-cli/skyhook-cli.git
git clone git@github.com:skyhook-cli/skyhook-templates.git
git clone git@github.com:skyhook-cli/sampleapp.git

clear
neofetch
