git config --global user.name "Jim Brighter"
git config --global user.email "jbrighter92@gmail.com"
git config --global core.autocrlf true

Invoke-RestMethod `
  -Uri https://raw.githubusercontent.com/jim-brighter/os-configs/master/git-clone.sh `
  -OutFile ~/git-clone.sh

'C:\Program Files\Git\git-bash.exe' -c "bash ~/git-clone.sh"
