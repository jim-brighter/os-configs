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
  battle.net `
  discord `
  docker-desktop `
  eclipse `
  epicgameslauncher `
  Firefox `
  git `
  google-backup-and-sync `
  GoogleChrome `
  gradle `
  nodejs-lts `
  nordvpn `
  origin `
  python `
  qbittorrent `
  steam `
  streamlabs-obs `
  sublimetext3 `
  vlc `
  vscode

scoop install git neofetch doctl
