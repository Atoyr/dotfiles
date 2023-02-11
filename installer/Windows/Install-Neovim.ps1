Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

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
