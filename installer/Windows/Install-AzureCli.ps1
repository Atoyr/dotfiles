Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install Microsoft.AzureCLI AzureCLI
        break
    }
    "upgrade" {
        Upgrade Microsoft.AzureCLI AzureCLI
        break
    }
    "uninstall" {
        Uninstall Microsoft.AzureCLI AzureCLI
        break
    }

    default {
        Exit;
    }
}
