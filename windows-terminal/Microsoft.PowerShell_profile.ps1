# Prompt
oh-my-posh init pwsh --config 'C:\Users\adnan\AppData\Local\Programs\oh-my-posh\themes\jblab_2021.omp.json' | Invoke-Expression

# load icons
Import-Module -Name Terminal-Icons

# fastfetch
fastfetch

# Aliases
Set-Alias backup_configs "$env:USERPROFILE\configFiles\backup-config-skript.ps1"

# functions
function notes {
	Set-Location "$env:USERPROFILE\Meine Ablage\Vaults\Notes"
}

# conda
$CondaExe = "C:\Users\Adnan\anaconda3\Scripts\conda.exe"
function conda {
	if (Test-Path $CondaExe) {
        (& $CondaExe "shell.powershell" "hook") | Out-String | Invoke-Expression
    }
    Remove-Item Function:\conda -Force
	conda
}
