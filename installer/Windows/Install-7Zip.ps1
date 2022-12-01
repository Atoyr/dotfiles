Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install 7zip.7zip 7zip
        break
    }
    "upgrade" {
        Upgrade 7zip.7zip 7zip
        break
    }
    "uninstall" {
        Uninstall 7zip.7zip 7Zip
        break
    }

    default {
        Exit;
    }
}

