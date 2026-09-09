# Require PowerShell 7 or newer
$PwshMajorVersion = 7

if ($PSVersionTable.PSVersion.Major -lt $PwshMajorVersion) {
	Write-Host "`nPowerShell 7 or newer is required to run this script." -ForegroundColor Red
	exit 1
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
	# Gitconfig
	@{
		Path     = "$HOME\.gitconfig"
		Target   = "$PWD\gitconfig"
	}
	# Pwsh profile
	@{
		Path     = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
		Target   = "$PWD\powershell\Microsoft.PowerShell_profile.ps1"
	}
	# Windows terminal settings
	@{
		Path     = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
		Target   = "$PWD\windows-terminal\settings.json"
	}
	# VSCode keybindings and settings
	@{
		Path     = "$env:APPDATA\Code\User\keybindings.json"
		Target   = "$PWD\vscode\keybindings.json"
	}
	@{
		Path     = "$env:APPDATA\Code\User\settings.json"
		Target   = "$PWD\vscode\settings.json"
	}
	# Oh my posh themes directory
	@{
		Path     = "$HOME\.omp-themes"
		Target   = "$PWD\omp-themes"
	}
	# Fastfetch settings
	@{
		Path     = "$HOME\.config\fastfetch"
		Target   = "$PWD\fastfetch"
	}
	# Neovim settings
	@{
		Path     = "$env:LOCALAPPDATA\nvim"
		Target   = "$PWD\nvim"
	}
	# Latexmk settings
	@{
		Path     = "$HOME\.latexmkrc"
		Target   = "$PWD\latexmkrc"
	}
)

foreach ($Path in $Paths) {
	# Create parent directory if it doesn't exist
	$ParentPath = Split-Path -Parent $Path["Path"]
	New-Item -ItemType Directory -Path $ParentPath -Force > $null

	New-Item -ItemType SymbolicLink @Path -Force # splatting
}

Write-Host "`nInstallation complete." -ForegroundColor Green
