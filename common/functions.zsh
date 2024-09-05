function git-clean-branches() {
    git fetch -pP
    git branch -vv | grep ': gone' | awk '{print $1}' | xargs git branch -D
}

function git-clean-tags() {
    git fetch -pP
    gh release ls -L 100 -O desc | tail -n +11 | awk '{print $1}' | xargs -I{} gh release delete {}
    git for-each-ref --sort=-creatordate --format '%(refname) %(creatordate)' refs/tags | tail -n +11 | awk '{print $1}' | xargs git push --delete origin
    git fetch -pP
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
