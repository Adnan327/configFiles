# destination
$target = "$HOME\configFiles"

# windows-terminal files
Copy-Item "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "$target\windows-terminal" -Force
Copy-Item $PROFILE "$target\windows-terminal" -Force

# glazewm files
Copy-Item "$HOME\.glzr\glazewm\config.yaml" "$target\glazewm" -Force

# vscode files
Copy-Item "$env:APPDATA\Code\User\settings.json" "$target\vscode" -Force
Copy-Item "$env:APPDATA\Code\User\keybindings.json" "$target\vscode" -Force

Write-Host "=====All files were succesfully copied to $target====="