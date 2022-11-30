Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    if (Is-Installed) {
        Write-Info "gsudo is installed... skipping."
    } else {
        Write-Info "Installing gsudo"
        winget install gerardog.gsudo
    }
}

function Upgrade {
    if (Is-Installed) {
        Write-Info "Upgrading gsudo"
        winget upgrade gerardog.gsudo
    } else {
        Write-Info "Installing gsudo"
        winget install gerardog.gsudo
    }
}

function Uninstall {

}

function Is-Installed {
    $info = winget list gerardog.gsudo
    return $info -Like "*gerardog.gsudo *"
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
