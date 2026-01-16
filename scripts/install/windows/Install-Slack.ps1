Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install SlackTechnologies.Slack Slack
        break
    }
    "upgrade" {
        Upgrade SlackTechnologies.Slack Slack
        break
    }
    "uninstall" {
        Uninstall SlackTechnologies.Slack Slack
        break
    }

    default {
        Exit;
    }
}
