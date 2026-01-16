Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install Neovim.Neovim Neovim
        break
    }
    "upgrade" {
        Upgrade Neovim.Neovim Neovim
        break
    }
    "uninstall" {
        Uninstall Neovim.Neovim Neovim
        break
    }

    default {
        Exit;
    }
}
