# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y --ignorechecksum `
  7zip `
  adobereader `
  battle.net `
  cpu-z `
  discord `
  epicgameslauncher `
  Firefox `
  google-backup-and-sync `
  GoogleChrome `
  hwmonitor `
  nordvpn `
  origin `
  qbittorrent `
  rufus `
  steam `
  streamlabs-obs `
  vlc
