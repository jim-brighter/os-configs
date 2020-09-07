#!/usr/bin/env bash

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
    mkdir -p $owner && cd $owner
    if [[ "$PROTOCOL" == "https" ]]; then
        git clone $https_url
    else
        git clone $ssh_url
    fi
    cd ..
done
