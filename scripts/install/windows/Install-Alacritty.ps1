Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install Alacritty.Alacritty Alacritty
        mkdir -p ~/.config/alacritty/themes
        git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
        break
    }
    "upgrade" {
        Upgrade Alacritty.Alacritty Alacritty
        break
    }
    "uninstall" {
        Uninstall Alacritty.Alacritty Alacritty
        break
    }

    default {
        Exit;
    }
}

