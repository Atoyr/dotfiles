Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\lib\pwsh\Installer.psm1

switch ($Flag) {
    "install" {
        Install Microsoft.VisualStudioCode VisualStudioCode
        break
    }
    "upgrade" {
        Upgrade Microsoft.VisualStudioCode VisualStudioCode
        break
    }
    "uninstall" {
        Uninstall Microsoft.VisualStudioCode VisualStudioCode
        break
    }

    default {
        Exit;
    }
}
