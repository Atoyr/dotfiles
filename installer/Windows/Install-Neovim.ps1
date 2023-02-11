Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Test-Installed) {
        Write-Info "Neovim is installed... skipping."
    } else {
        Write-Info "Installing Neovim"
        winget install -s winget --silent Neovim.Neovim
        git clone https://github.com/wbthomason/packer.nvim "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])\nvim-data\site\pack\packer\start\packer.nvim"
    }
}

function Upgrade {
    if (Test-Installed) {
        Write-Info "Upgrading Neovim"
        winget -s winget upgrade Neovim.Neovim
    } else {
        Install
    }

}

function Uninstall {

}

switch ($Flag) {
    "install" {
        Install
        break
    }

    default {
        Exit;
    }
}
