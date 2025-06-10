function git-clean-branches() {
    git fetch -pP
    git branch -vv | grep ': gone' | awk '{print $1}' | xargs git branch -D
}

function clone() {
    repo=$(echo $1 | cut -d':' -f2 | sed -e 's/\.git$//')

    mkdir -p ~/github

    cd ~/github

    gh repo clone $repo $repo
}

function clone-all() {

    gh auth status

    ssh-add -l

    read "continue?Continue (Y/n) "

    if [[ "$continue" == "n" ]]; then
        return 0
    fi

    if [[ -z "$1" ]]; then
        echo "Cloning repos for username"
    else
        echo "Cloning repos for $1"
    fi

    mkdir -p ~/github

    cd ~/github

    gh repo ls --no-archived $1 | awk '{print $1}' | xargs -I{} gh repo clone {} {}
}

function start-docker() {
    if [[ "$OSTYPE" =~ ^darwin.* ]]; then
        open /Applications/Docker.app
    else
        /mnt/c/Program\ Files/Docker/Docker/Docker\ Desktop.exe
    fi
}

function update() {
    if [[ "$OSTYPE" =~ ^darwin.* ]]; then
        brew update && brew upgrade; brew autoremove && brew cleanup
    else
        sudo apt update && sudo apt full-upgrade -y; sudo apt autoremove -y
    fi
}

