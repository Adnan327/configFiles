# Prompt
oh-my-posh init pwsh --config 'C:\Users\adnan\AppData\Local\Programs\oh-my-posh\themes\jblab_2021.omp.json' | Invoke-Expression

# load icons
Import-Module -Name Terminal-Icons

# fastfetch
fastfetch

# Aliases

Set-Alias backup_configs "$env:USERPROFILE\configFiles\backup-config-skript.ps1"
