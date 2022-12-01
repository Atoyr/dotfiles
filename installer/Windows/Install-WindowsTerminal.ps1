Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install Microsoft.WindowsTerminal WindowsTerminal
        break
    }
    "upgrade" {
        Upgrade Microsoft.WindowsTerminal WindowsTerminal
        break
    }
    "uninstall" {
        Uninstall Microsoft.WindowsTerminal WindowsTerminal
        break
    }

    default {
        Exit;
    }
}
