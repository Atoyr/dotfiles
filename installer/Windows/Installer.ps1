Param ( 
[string]$Id = "",
[string]$Name = "",
[string]$Flag = ""
)

if ($Name -eq "" -Or $Id -eq "") {
    Write-Error "Args not found"
    Exit
}

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "$Name is installed... skipping."
    } else {
        Write-Info "Installing $Name"
        winget install --silent --id $Id
        if (!$?) {
            Write-Error "Installing $Name is failed."
        }
    }
}

function Upgrade {
    if (Is-Installed) {
        Write-Info "Upgrading $Name"
        winget upgrade $Id
    } else {
        Write-Error "$Name is not installed... skipping."
    }
}

function Uninstall {
    if (Is-Installed) {
        Write-Info "Uninstall $Name"
        winget uninstall $Id
    } else {
        Write-Info "$Name is not installed... skipping."
    }
}

function Is-Installed {
    $info = winget list $Id
    return $info -Like "*$Id *"
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

