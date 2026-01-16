Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install AgileBits.1Password 1Pasword
        break
    }
    "upgrade" {
        Upgrade AgileBits.1Password 1Pasword
        break
    }
    "uninstall" {
        Uninstall AgileBits.1Password 1Pasword
        break
    }

    default {
        Exit;
    }
}
