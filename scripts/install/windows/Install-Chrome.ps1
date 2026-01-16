Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install Google.Chrome Chrome
        break
    }
    "upgrade" {
        Upgrade Google.Chrome Chrome
        break
    }
    "uninstall" {
        Uninstall Google.Chrome Chrome
        break
    }

    default {
        Exit;
    }
}

