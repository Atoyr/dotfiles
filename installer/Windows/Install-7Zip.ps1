Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "7Zip is installed... skipping."
    } else {
        Write-Info "Installing 7Zip"
        winget install 7zip.7zip
    }
}

function Upgrade {

}

function Uninstall {

}

function Is-Installed {
    $info = winget list 7zip.7zip
    return $info -Like "*7zip.7zip *"
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
