#!/bin/bash

set -e

function log() {
    echo "==> $1"
}

function initMac() {
    log "Checking if ~/.ssh/id_rsa exists"
    if [ ! -f ~/.ssh/id_rsa ]; then
        log "ssh id_rsa file doesn't exist, exiting now!"
        exit 1
    fi

    log "Installing xcode command line tools"
    xcode-select --install

    DONE_INPUT=""
    read -p "Enter 'done' when xcode command line tools are finished installing: " DONE_INPUT
    echo

    if [ $DONE_INPUT != "done" ]; then
        log "not 'done'"
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
    curl -L https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/robbyrussell.zsh-theme -o ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme

    log "Setup zsh (and bash) config"
    touch ~/.bash_profile
    touch ~/.zshrc
    touch ~/.zshenv

    curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/bash_profile.bak
    curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/zshrc.bak
    curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/zshenv.bak

    cat bash_profile.bak >> ~/.bash_profile
    cat zshrc.bak >> ~/.zshrc
    cat zshenv.bak >> ~/.zshenv

    rm bash_profile.bak zshrc.bak zshenv.bak

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
    log "Remember to read the README for the rest of setup instructions"
}

initMac 2>&1 | tee init.log
