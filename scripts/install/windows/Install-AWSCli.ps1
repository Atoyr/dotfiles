Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install Amazon.AWSCLI AWSCli
        break
    }
    "upgrade" {
        Upgrade Amazon.AWSCLI AWSCli
        break
    }
    "uninstall" {
        Uninstall Amazon.AWSCLI AWSCli
        break
    }

    default {
        Exit;
    }
}
