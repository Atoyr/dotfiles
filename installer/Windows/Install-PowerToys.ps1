Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install Microsoft.PowerToys PowerToys
        break
    }
    "upgrade" {
        Upgrade Microsoft.PowerToys PowerToys
        break
    }
    "uninstall" {
        Uninstall Microsoft.PowerToys PowerToys
        break
    }

    default {
        Exit;
    }
}
