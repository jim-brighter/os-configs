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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    log "Installing cli tools via homebrew"
    brew install \
        awscli \
        doctl \
        git \
        go \
        gradle \
        htop \
        jq \
        neofetch \
        nvm \
        openjdk@11 \
        python

    log "Setting up NVM config in this shell"
    mkdir -p ~/.nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"

    log "Installing nodejs"
    nvm install 12

    log "Installing homebrew casks"
    brew tap AdoptOpenJDK/openjdk
    brew tap homebrew/cask-fonts
    brew cask install \
        adoptopenjdk11 \
        discord \
        docker \
        eclipse-jee \
        firefox \
        font-caskaydia-cove-nerd-font \
        font-meslolg-nerd-font \
        font-saucecodepro-nerd-font \
        google-backup-and-sync \
        google-chrome \
        iterm2 \
        nordvpn \
        postman \
        powershell \
        qbittorrent \
        slack \
        spotify \
        steam \
        sublime-text \
        visual-studio-code \
        vlc

    log "Installing ohmyzsh and powerlevel10k"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

    log "Setup zsh (and bash) config"
    touch ~/.bash_profile
    touch ~/.zshrc
    touch ~/.zshenv

    curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/bash_profile.bak
    curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/zshrc.bak
    curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/zshenv.bak
    curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/zprofile.bak

    curl -L https://raw.githubusercontent.com/jim-brighter/os-configs/master/macos/vimrc.bak -o ~/.vimrc

    cat bash_profile.bak >> ~/.bash_profile
    cat zshrc.bak >> ~/.zshrc
    cat zshenv.bak >> ~/.zshenv
    cat zprofile.bak >> ~/.zprofile

    rm bash_profile.bak zshrc.bak zshenv.bak zprofile.bak

    log "Configuring git"
    git config --global user.name "Jim Brighter"
    git config --global user.email "jbrighter92@gmail.com"

    log "Cloning git repos"
    curl -LO https://raw.githubusercontent.com/jim-brighter/os-configs/master/git-clone.sh
    bash ./git-clone.sh

    cd

    clear && neofetch

    echo
    log "Done!"
    log "Remember to read the README for the rest of setup instructions"
}

initMac 2>&1 | tee init.log
