Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install NickeManarin.ScreenToGif ScreenToGif
        break
    }
    "upgrade" {
        Upgrade NickeManarin.ScreenToGif ScreenToGif
        break
    }
    "uninstall" {
        Uninstall NickeManarin.ScreenToGif ScreenToGif
        break
    }

    default {
        Exit;
    }
}
