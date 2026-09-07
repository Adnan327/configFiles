##################
### Oh my posh ###
##################

$theme = "robbyrussell"
oh-my-posh init pwsh --config "$HOME\.omp-themes\$theme.omp.json" | Invoke-Expression


#################
### Fastfetch ###
#################

fastfetch


###############
### Modules ###
###############

Import-Module -Name Terminal-Icons
Import-Module -Name Microsoft.WinGet.CommandNotFound


###############
### Aliases ###
###############

function notes {
	Set-Location "$env:USERPROFILE\Meine Ablage\Vaults\Notes"
}

