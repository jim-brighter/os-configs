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
  Firefox `
  git `
  google-backup-and-sync `
  GoogleChrome `
  gradle `
  nodejs-lts `
  nordvpn `
  notepadplusplus `
  origin `
  powershell-core `
  python `
  qbittorrent `
  rufus `
  steam `
  streamlabs-obs `
  virtualbox `
  vlc `
  vscode

scoop install git neofetch

Invoke-RestMethod `
  -Uri https://github.com/digitalocean/doctl/releases/download/v1.20.1/doctl-1.20.1-windows-4.0-amd64.zip `
  -OutFile ~/Downloads/doctl-1.20.1-windows-4.0-amd64.zip

Set-Location -Path ~/Downloads
Expand-Archive -Path doctl-1.20.1-windows-4.0-amd64.zip
Move-Item -Path doctl-1.20.1-windows-4.0-amd64 -Destination ~

[Environment]::SetEnvironmentVariable(`
  "Path", `
  [Environment]::GetEnvironmentVariable("Path", `
    [EnvironmentVariableTarget]::User) + ";C:\Users\jimbr\doctl-1.20.1-windows-4.0-amd64", `
  [EnvironmentVariableTarget]::User)
