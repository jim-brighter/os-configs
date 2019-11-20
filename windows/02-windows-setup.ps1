pip install awscli --upgrade

git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"
git config --global core.autocrlf true

mkdir ~/projects
mkdir ~/projects/personal
mkdir ~/projects/maximus

Set-Location -Path ~/projects/personal
git clone git@github.com:jim-brighter/planner.git
git clone git@github.com:jim-brighter/photodump.git
git clone git@github.com:jim-brighter/jenkins.git
git clone git@github.com:jim-brighter/jim-brighter.github.io.git
git clone git@github.com:jim-brighter/ops-secrets.git
git clone git@github.com:jim-brighter/os-configs.git

Set-Location -Path ~/projects/maximus
git clone git@github.com:jim-brighter/maximus-infrastructure.git
git clone git@github.com:jim-brighter/maximus-sampleapp.git
git clone git@github.com:jim-brighter/maximus-demo.git

clear
neofetch
