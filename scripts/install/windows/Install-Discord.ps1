Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install Discord.Discord Discord
        break
    }
    "upgrade" {
        Upgrade Discord.Discord Discord
        break
    }
    "uninstall" {
        Uninstall Discord.Discord Discord
        break
    }

    default {
        Exit;
    }
}
