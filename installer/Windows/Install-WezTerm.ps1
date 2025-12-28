Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install wez.wezterm WezTerm
        break
    }
    "upgrade" {
        Upgrade wez.wezterm WezTerm
        break
    }
    "uninstall" {
        Uninstall wez.wezterm WezTerm
        break
    }

    default {
        Exit;
    }
}

