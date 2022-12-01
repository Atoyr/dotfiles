Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install gerardog.gsudo gsudo
        break
    }
    "upgrade" {
        Upgrade gerardog.gsudo gsudo
        break
    }
    "uninstall" {
        Uninstall gerardog.gsudo gsudo
        break
    }

    default {
        Exit;
    }
}
