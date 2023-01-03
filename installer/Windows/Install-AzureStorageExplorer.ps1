Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install Microsoft.AzureStorageExplorer AzureStorageExplorer
        break
    }
    "upgrade" {
        Upgrade Microsoft.AzureStorageExplorer AzureStorageExplorer
        break
    }
    "uninstall" {
        Uninstall Microsoft.AzureStorageExplorer AzureStorageExplorer
        break
    }

    default {
        Exit;
    }
}
