Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Test-Installed) {
        Write-Info "OhMyPosh is installed... skipping."
    } else {
        Write-Info "Installing OhMyPosh"
        winget install --silent JanDeDobbeleer.OhMyPosh -s winget
        if (!(Test-Path $PROFILE)) {
            New-Item -Path $PROFILE -Type File -Force
        }
        oh-my-posh init pwsh | Invoke-Expression
    }
}

function Upgrade {
    if (Test-Installed) {
        Write-Info "Upgrading OhMyPosh"
        winget upgrade JanDeDobbeleer.OhMyPosh
    } else {
        Write-Info "OhMyPosh is not installed... skipping."
    }

}

function Uninstall {
    if (Test-Installed) {
        Write-Info "Uninstall OhMyPosh"
        winget uninstall JanDeDobbeleer.OhMyPosh
    } else {
        Write-Info "OhMyPosh is not installed... skipping."
    }

}

function Test-Installed {
    $info = winget list -s winget JanDeDobbeleer.OhMyPosh
    return $info -Like "*JanDeDobbeleer.OhMyPosh *"
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

