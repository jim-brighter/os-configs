#!/bin/bash
set -ex
docker login
cd ~
cp /media/sf_vm-shared/ssh.tar.gz .
tar -zxf ssh.tar.gz
rm ssh.tar.gz
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
mkdir projects
cd projects
git clone git@github.com:jim-brighter/planner.git
git clone git@github.com:jim-brighter/jenkins.git
git clone git@github.com:jim-brighter/photodump.git
git clone git@github.com:jim-brighter/profile_backups.git
git clone git@github.com:jim-brighter/jim-brighter.github.io.git
git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"
cat ./profile_backups/bash_profile_backup >> ~/.bashrc
