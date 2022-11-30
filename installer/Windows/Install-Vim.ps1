Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "Vim is installed... skipping."
    } else {
        Write-Info "Installing Vim"
        winget install --silent vim.vim
        if (Test-Path $HOME\vimfiles) {
            New-Item $HOME\vimfiles -ItemType Directory
        }
        iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni $HOME/vimfiles/autoload/plug.vim -Force
    }
}

function Upgrade {
    if (Is-Installed) {
        Write-Info "Upgrading Vim"
        winget upgrade vim.vim
    } else {
        Install
    }

}

function Uninstall {

}

function Is-Installed {
    $info = winget list vim.vim
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
