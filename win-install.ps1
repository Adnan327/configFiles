# If the script is running on an older PowerShell version, install PowerShell 7
# and restart the script with the newer version
$PwshMajorVersion = 7

if ($PSVersionTable.PSVersion.Major -lt $PwshMajorVersion) {
	Write-Host "`nInstalling Microsoft PowerShell..." -ForegroundColor Cyan
	winget install --id "Microsoft.PowerShell" --exact --accept-package-agreements --accept-source-agreements
	# Start the script again in the new shell using the same file path
	& "$env:ProgramFiles\PowerShell\$PwshMajorVersion\pwsh.exe" -File $PSCommandPath

	exit
}


############################
### Install applications ###
############################

Write-Host "`nInstalling applications..." -ForegroundColor Cyan
$InstalledProgramsCounter = 0

$Programs = @(
	"Git.Git"                     # git
	"JanDeDobbeleer.OhMyPosh"     # oh-my-posh
	"Fastfetch-cli.Fastfetch"     # fastfetch
	"Neovim.Neovim"               # neovim
	"Microsoft.WindowsTerminal"   # windows terminal
	"Microsoft.VisualStudioCode"  # vscode
)

# Installs only programs with this exact ID
foreach ($Program in $Programs) {
	winget list --id $Program --exact > $null
	if ($LASTEXITCODE -ne 0) {
		winget install --id $Program --exact --accept-package-agreements --accept-source-agreements
		$InstalledProgramsCounter++
	}
}

if ($InstalledProgramsCounter -eq 0) {
	Write-Host "No applications installed."
}


#######################
### Install modules ###
#######################

Write-Host "`nInstalling PowerShell modules..." -ForegroundColor Cyan
$InstalledModulesCounter = 0

$Modules = @(
	"Terminal-Icons"
	"Microsoft.WinGet.CommandNotFound"
)

# Installs modules only for the current user
foreach ($Module in $Modules) {
	if (-not (Get-Module -ListAvailable -Name $Module)) {
		Install-PSResource -Name $Module -Scope CurrentUser -TrustRepository
		$InstalledModulesCounter++
	}
}

if ($InstalledModulesCounter -eq 0) {
	Write-Host "No modules installed."
}


################
### Symlinks ###
################

# Path = link
# Target = original directory/file

Write-Host "`nCreating symbolic links..." -ForegroundColor Cyan

$Paths = @(
	# Pwsh profile
	@{
		Path     = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
		Target   = "$HOME\.dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
	}
	# Windows terminal settings
	@{
		Path     = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
		Target   = "$HOME\.dotfiles\windows-terminal\settings.json"
	}
	# VSCode keybindings and settings
	@{
		Path     = "$env:APPDATA\Code\User\keybindings.json"
		Target   = "$HOME\.dotfiles\vscode\keybindings.json"
	}
	@{
		Path     = "$env:APPDATA\Code\User\settings.json"
		Target   = "$HOME\.dotfiles\vscode\settings.json"
	}
	# Oh my posh themes directory
	@{
		Path     = "$HOME\.omp-themes"
		Target   = "$HOME\.dotfiles\omp-themes"
	}
	# Fastfetch settings
	@{
		Path     = "$HOME\.config\fastfetch"
		Target   = "$HOME\.dotfiles\fastfetch"
	}
	# Neovim settings
	@{
		Path     = "$env:LOCALAPPDATA\nvim"
		Target   = "$HOME\.dotfiles\nvim"
	}
	# Latexmk settings
	@{
		Path     = "$HOME\.latexmkrc"
		Target   = "$HOME\.dotfiles\latexmkrc"
	}
)

foreach ($Path in $Paths) {
	New-Item -ItemType SymbolicLink @Path -Force # splatting
}


Write-Host "`nInstallation complete." -ForegroundColor Green

