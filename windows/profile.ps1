Set-Alias -Name l -Value dir
Set-Alias -Name git-bash -Value "C:\Program Files\Git\git-bash.exe"

function dropToAdmin {Start-Process powershell -Verb runAs}
Set-Alias -Name sudo -Value dropToAdmin
