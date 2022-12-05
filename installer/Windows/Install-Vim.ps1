Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Test-Installed) {
        Write-Info "Vim is installed... skipping."
    } else {
        Write-Info "Installing Vim"
        winget install -s winget --silent vim.vim
        if (!(Test-Path $HOME\vimfiles)) {
            New-Item $HOME\vimfiles -ItemType Directory
        }
        iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni $HOME/vimfiles/autoload/plug.vim -Force
    }
}

function Upgrade {
    if (Test-Installed) {
        Write-Info "Upgrading Vim"
        winget -s winget upgrade vim.vim
    } else {
        Install
    }

}

function Uninstall {

}

function Test-Installed {
    $info = winget list -s winget vim.vim
    return $info -Like "*vim.vim *"
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
