function cloneAllRepos() {
    PROTOCOL=${1:-ssh}

    echo "Protocol: $PROTOCOL"

    read -p "token? " TOKEN

    mkdir -p ~/github
    cd ~/github

    curl --location --request GET 'https://api.github.com/user/repos' \
    --header 'Accept: application/vnd.github.v3+json' \
    --header "Authorization: token $TOKEN" \
    | jq -r '.[] | [.owner.login, .ssh_url, .clone_url] | @tsv' \
    | while IFS=$'\t' read -r owner ssh_url https_url; do
        if [[ "$PROTOCOL" == "https" ]]; then
            clone $https_url
        else
            clone $ssh_url
        fi
    done
}

function clone() {
    cd ~/github
    prefix=$(echo $1 | cut -c1-3)
    if [[ "$prefix" == "git" ]]; then
        owner=$(echo $1 | cut -d':' -f 2 | cut -d'/' -f 1)
	infostellar=0
    else
        owner=$(echo $1 | cut -d'/' -f 4)
        repo=$(echo $1 | cut -d'/' -f 5)
        repo=$(echo $repo | cut -d'.' -f 1)
        infostellar=1
    fi

    mkdir -p $owner && cd $owner

    git clone $1

    if [ $infostellar = 1 ]; then
        cd $repo
        git config user.email "jim@infostellarinc.com"
    fi
}
