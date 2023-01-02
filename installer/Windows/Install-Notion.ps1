Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\Installer.psm1

switch ($Flag) {
    "install" {
        Install Notion.Notion Notion
        break
    }
    "upgrade" {
        Upgrade Notion.Notion Notion
        break
    }
    "uninstall" {
        Uninstall Notion.Notion Notion
        break
    }

    default {
        Exit;
    }
}
