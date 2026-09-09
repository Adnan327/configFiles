# Configs

Setup for:

1. VS Code
2. Windows Terminal
3. Bash
4. Zsh
5. Neovim
6. Git
7. Latexmk
8. Fastfetch
9. Oh My Posh


## Installation

**Windows**

1. Enable Windows Developer Mode

2. Install [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)

3. Install [Oh My Posh](https://ohmyposh.dev/)
```PowerShell
winget install JanDeDobbeleer.OhMyPosh --source winget
```

4. Install [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
```PowerShell
winget install Fastfetch-cli.Fastfetch --source winget
```

5. Clone the repository and change into it
```PowerShell
git clone https://github.com/adnanmemic/dev-config.git ~/.dev-config && Set-Location ~/.dev-config
```

6. Start the installation script
```PowerShell
.\win-install.ps1
```


**Linux / WSL**

1. Install [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)

2. Install [Oh My Posh](https://ohmyposh.dev/)
```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

3. Install [Oh My Zsh](https://ohmyz.sh)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. Install [Fastfetch](https://github.com/fastfetch-cli/fastfetch)

5. Clone the repository and change into it
```bash
git clone https://github.com/adnanmemic/dev-config.git ~/.dev-config && cd ~/.dev-config
```

6. Start the installation script
```bash
./lin-install
```
