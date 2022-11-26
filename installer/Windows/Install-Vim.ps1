Param ( [string]$Flag = "")

Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    Write-Error "not define"
}

function Upgrade {

}

function Uninstall {

}

function Is-Installed {

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
