Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "Chrome is installed... skipping."
    } else {
        Write-Info "Installing Chrome"
        winget install --silent Google.Chrome
    }
}

function Upgrade {

}

function Uninstall {

}

function Is-Installed {
    $info = winget list Google.Chrome
    return $info -Like "*Google.Chrome *"
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
