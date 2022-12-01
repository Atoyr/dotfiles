Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "PowerToys is installed... skipping."
    } else {
        Write-Info "Installing PowerToys"
        winget install --silent --id Microsoft.PowerToys
        if (!$?) {
            Write-Error "Installing PowerToys is failed."
        }
    }
}

function Upgrade {
    if (Is-Installed) {
        Write-Info "Upgrading PowerToys"
        winget upgrade Microsoft.PowerToys
    } else {
        Write-Error "PowerToys is not installed... skipping."
    }
}

function Uninstall {
    if (Is-Installed) {
        Write-Info "Uninstall PowerToys"
        winget uninstall Microsoft.PowerToys
    } else {
        Write-Info "PowerToys is not installed... skipping."
    }
}

function Is-Installed {
    $info = winget list Microsoft.PowerToys
    return $info -Like "*Microsoft.PowerToys *"
}

switch ($Flag) {
    "install" {
        Install
        break
    }
    "upgrade" {
        Upgrade
        break
    }
    "uninstall" {
        Uninstall
        break
    }
    default {
        Exit;
    }
}
