Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install WinMerge.WinMerge WinMerge
        break
    }
    "upgrade" {
        Upgrade WinMerge.WinMerge WinMerge
        break
    }
    "uninstall" {
        Uninstall WinMerge.WinMerge WinMerge
        break
    }

    default {
        Exit;
    }
}
