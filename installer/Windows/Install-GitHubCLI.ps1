Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "GitHub CLI is installed... skipping."
    } else {
        Write-Info "Installing GitHub CLI"
        winget install GitHub.cli
    }
}

function Upgrade {

}

function Uninstall {

}

function Is-Installed {
    $info = winget list GitHub.cli
    return $info -Like "*GitHub.cli *"
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
