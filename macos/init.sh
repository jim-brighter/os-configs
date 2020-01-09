#!/bin/bash

set -e

function log() {
    echo "==> $1"
}

log "Checking if ~/.ssh/id_rsa exists"
if [ ! -f ~/.ssh/id_rsa ]; then 
    echo "ssh id_rsa file doesn't exist, exiting now!"
    exit 1
fi

log "Installing xcode command line tools"
xcode-select --install

DONE_INPUT=""
read -p "Enter 'done' when xcode command line tools are finished installing: " DONE_INPUT

if [ $DONE_INPUT != "done" ]; then
    echo "not 'done'"
    exit 1
fi

log "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

log "Installing cli tools via homebrew"
brew install \
    doctl \
    git \
    gradle \
    neofetch \
    nvm \
    python

log "Setting up NVM config in this shell"
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"

log "Installing nodejs and awscli"
nvm install 12
pip3 install awscli --upgrade

log "Installing homebrew casks"
brew cask
brew tap AdoptOpenJDK/openjdk
brew tap homebrew/cask-fonts
brew cask install \
    adoptopenjdk11 \
    discord \
    docker \
    eclipse-jee \
    firefox \
    font-meslo-nerd-font-mono \
    google-backup-and-sync \
    google-chrome \
    iterm2 \
    nordvpn \
    powershell \
    qbittorrent \
    slack \
    spotify \
    steam \
    sublime-text \
    visual-studio-code \
    vlc

log "Installing ohmyzsh and powerlevel9k"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

touch ~/.bash_profile
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile
echo '[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"' >> ~/.bash_profile
echo '[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.bash_profile

touch ~/.zshrc
touch ~/.zshenv
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshenv
echo '[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"' >> ~/.zshrc
echo '[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zshrc

log "Configuring git"
git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"

log "Creating directories and cloning repos"
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

echo
log "Done!"

echo '--------------------------------------------------'
echo 'Remember to set the following in ~/.zshrc:'
echo 'ZSH_THEME="powerlevel9k/powerlevel9k"'
echo 'POWERLEVEL9K_PROMPT_ON_NEWLINE=true'
echo 'POWERLEVEL9K_MODE="nerdfont-complete"'
echo 'POWERLEVEL9K_SHORTEN_DIR_LENGTH="1"'
echo 'POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"'
echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)'
echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)'
echo
echo 'Then change iTerm2 font to MesloLGM Nerd Font Mono'
