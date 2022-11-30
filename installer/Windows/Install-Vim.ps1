Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "Vim is installed... skipping."
    } else {
        Write-Info "Installing Vim"
        winget install vim.vim
    }
}

function Upgrade {

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