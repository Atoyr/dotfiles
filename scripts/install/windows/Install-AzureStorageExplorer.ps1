Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

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
