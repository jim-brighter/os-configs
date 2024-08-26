alias l="ls -lh"
alias la="ls -alh"
alias l1="ls -1"
alias ..="cd .."

# alias update="brew update && brew upgrade; brew autoremove && brew cleanup"
# alias update="sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y"

function git-clean() {
    git branch -vv | grep ': gone' | awk '{print $1}' | xargs git branch -D
}

function git-clean-tags() {
    gh release ls -L 100 -O asc | head -n -5 | awk '{print $1}' | xargs -I{} gh release delete {}
    git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags | head -n -5 | awk '{print $1}' | xargs -I{} git push --delete origin {} && git tag -d {}
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
