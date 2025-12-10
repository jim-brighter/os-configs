## Windows 11 Setup Instructions
- Follow Windows installer until you get to the Desktop
- Install all available Windows updates
- Install Armoury Create and Nvidia App, then install newer drivers for motherboard (chipset, network, audio) and graphics
- Check for and remove bloatware
- Install Windows software:
  ```powershell
  winget install `
  9N7F2SM5D1LR `
  NZXT.CAM `
  Logitech.GHUB `
  Discord.Discord `
  Valve.Steam `
  ElectronicArts.EADesktop `
  EpicGames.EpicGamesLauncher `
  GOG.Galaxy `
  Ubisoft.Connect `
  Blizzard.BattleNet `
  REALiX.HWiNFO `
  Mojang.MinecraftLauncher
  ```
----

### Fixes
| Problem | Solution |
| :---    | :---     |
| Internet connectivity or loading problems | Disable IPv6 in ethernet adapter properties |
| Colors look washed out/dull | Disable "Automatically manage color" in Display Settings |
