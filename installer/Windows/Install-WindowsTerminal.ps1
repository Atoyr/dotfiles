Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "WindowsTerminal is installed... skipping."
    } else {
        Write-Info "Installing WindowsTerminal"
        winget install Microsoft.WindowsTerminal
    }
    
}

function Upgrade {

}

function Uninstall {

}

function Is-Installed {
    $info = winget list Microsoft.WindowsTerminal
    return $info -Like "*Microsoft.WindowsTerminal *"
}

switch ($Flag) {
    "install" {
        Install
        break
    }

    default {
        Exit;
    }
}
