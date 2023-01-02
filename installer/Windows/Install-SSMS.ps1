Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install  Microsoft.SQLServerManagementStudio SQLServerManagementStudio
        break
    }
    "upgrade" {
        Upgrace Microsoft.SQLServerManagementStudio SQLServerManagementStudio
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
