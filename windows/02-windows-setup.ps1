pip install awscli --upgrade

git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"
git config --global core.autocrlf true

mkdir ~/projects
mkdir ~/projects/personal
mkdir ~/projects/infostellar
mkdir ~/projects/misc

Set-Location -Path ~/projects/misc
mkdir shyam
mkdir maximus

Set-Location -Path ~/projects/personal
git clone git@github.com:jim-brighter/planner.git
git clone git@github.com:jim-brighter/photodump.git
git clone git@github.com:jim-brighter/jenkins.git
git clone git@github.com:jim-brighter/jim-brighter.github.io.git
git clone git@github.com:jim-brighter/ops-secrets.git
git clone git@github.com:jim-brighter/profile_backups.git
git clone git@github.com:jim-brighter/devops-infrastructure.git
git clone git@github.com:jim-brighter/devops-springboot.git

Set-Location -Path ~/projects/infostellar
git clone https://github.com/jbrighter/samplejava.git
git clone https://github.com/jbrighter/samplejenkins.git
git clone https://github.com/jbrighter/devops-infrastructure.git
git clone https://github.com/jbrighter/devops-springboot.git

Set-Location -Path ~/projects/infostellar/samplejava
git config user.email "jim@infostellarinc.com"

Set-Location -Path ~/projects/infostellar/samplejenkins
git config user.email "jim@infostellarinc.com"

Set-Location -Path ~/projects/infostellar/devops-springboot
git config user.email "jim@infostellarinc.com"

Set-Location -Path ~/projects/infostellar/devops-infrastructure
git config user.email "jim@infostellarinc.com"

Set-Location -Path ~/projects/misc/shyam
git clone git@github.com:shyamuserid/KISS-webapp.git
git clone git@github.com:shyamuserid/cicd-wand.git

Set-Location -Path ~/projects/misc/maximus
git clone git@github.com:jim-brighter/maximus-infrastructure.git
git clone git@github.com:jim-brighter/maximus-sampleapp.git
git clone git@github.com:jim-brighter/maximus-demo.git
