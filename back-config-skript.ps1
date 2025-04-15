# destination
$target = "$HOME\configFiles"

# vscode files
Copy-Item "$env:APPDATA\Code\User\settings.json" $target\vscode -Force
Copy-Item "$env:APPDATA\Code\User\keybindings.json" $target\vscode -Force

Write-Host "=====All files were succesfully copied to $target====="