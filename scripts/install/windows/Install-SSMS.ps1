Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install Microsoft.SQLServerManagementStudio SQLServerManagementStudio
        break
    }
    "upgrade" {
        Upgrade Microsoft.SQLServerManagementStudio SQLServerManagementStudio
        break
    }
    "uninstall" {
        Uninstall Microsoft.SQLServerManagementStudio SQLServerManagementStudio
        break
    }

    default {
        Exit;
    }
}
