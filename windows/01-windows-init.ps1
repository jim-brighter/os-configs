# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

if (!(Test-Path ~/.ssh/id_rsa)) {
  Write-Warning "ssh id_rsa file not found, exiting..."
  exit
}

choco install -y --ignorechecksum `
  7zip `
  adobereader `
  adoptopenjdk11 `
  awscli `
  battle.net `
  cpu-z `
  discord `
  docker-desktop `
  doctl `
  eclipse `
  epicgameslauncher `
  Firefox `
  git `
  golang `
  google-backup-and-sync `
  GoogleChrome `
  gradle `
  hwmonitor `
  intellijidea-community `
  jq `
  kubernetes-helm `
  nodejs-lts `
  nordpass `
  nordvpn `
  origin `
  postman `
  python `
  qbittorrent `
  rufus `
  steam `
  streamlabs-obs `
  sublimetext3 `
  vlc `
  vscode
