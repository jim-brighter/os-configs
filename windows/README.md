## Windows 11 Setup Instructions
- Follow Windows installer until you get to the Desktop
- Install all available Windows updates
- Install newer drivers for motherboard (chipset, network, audio) and graphics (NVIDIA App included below)
- Check for and remove bloatware
- Install Windows software:
  ```powershell
  winget install `
  XP8CLZL93F5Z4P # NVIDIA App `
  9N7F2SM5D1LR # Windows HDR Calibration Tool `
  Google.Chrome `
  NZXT.CAM `
  Logitech.GHUB `
  Discord.Discord `
  Valve.Steam `
  ElectronicArts.EADesktop `
  GOG.Galaxy `
  REALiX.HWiNFO
  ```
- Other Launchers:
  ```powershell
  winget install `
  EpicGames.EpicGamesLauncher `
  Ubisoft.Connect `
  Blizzard.BattleNet `
  Mojang.MinecraftLauncher
  ```
----

### Fixes
| Problem | Solution |
| :---    | :---     |
| Internet connectivity or loading problems | Disable IPv6 in ethernet adapter properties |
| Colors look washed out/dull | Disable "Automatically manage color" in Display Settings |
