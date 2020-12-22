# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

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
  eclipse `
  epicgameslauncher `
  Firefox `
  git `
  golang `
  google-backup-and-sync `
  GoogleChrome `
  gradle `
  hwmonitor `
  jq `
  nodejs-lts `
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

scoop install git neofetch doctl
