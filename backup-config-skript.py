import shutil
import os
from pathlib import Path

APPDATA = Path(os.environ["APPDATA"])
LOCALAPPDATA = Path(os.environ["LOCALAPPDATA"])
HOME = Path.home()
PROFILE = HOME/"Documents/PowerShell/Microsoft.PowerShell_profile.ps1"

destinationPath = HOME/"configFiles"

# windows terminal settings and profile
windows_terminal_path = destinationPath/"windows-terminal"
windows_terminal_path.mkdir(exist_ok=True)
shutil.copy(LOCALAPPDATA/"Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json", windows_terminal_path)
shutil.copy(PROFILE, windows_terminal_path)

# vscode settings and keybindings
vscode_path = destinationPath/"vscode"
vscode_path.mkdir(exist_ok=True)
shutil.copy(APPDATA/"Code/User/settings.json", vscode_path)
shutil.copy(APPDATA/"Code/User/keybindings.json", vscode_path)

# nvim settings
nvim_path = destinationPath/"nvim"
shutil.copytree(LOCALAPPDATA/"nvim", nvim_path, dirs_exist_ok=True)