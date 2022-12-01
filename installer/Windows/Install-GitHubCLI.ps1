Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install GitHub.cli "GitHub CLI"
        break
    }
    "upgrade" {
        Upgrade GitHub.cli "GitHub CLI"
        break
    }
    "uninstall" {
        Uninstall GitHub.cli "GitHub CLI"
        break
    }

    default {
        Exit;
    }
}
