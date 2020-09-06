#!/usr/bin/env bash

read -p "token? " TOKEN

mkdir -p ~/github
cd ~/github

curl --location --request GET 'https://api.github.com/user/repos' \
--header 'Accept: application/vnd.github.v3+json' \
--header "Authorization: token $TOKEN" \
| jq -r '.[] | [.owner.login, .ssh_url] | @tsv' \
| while IFS=$'\t' read -r owner url; do
    mkdir -p $owner && cd $owner && git clone $url && cd ..
done
