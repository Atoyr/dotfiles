Import-Module $PSScriptRoot\..\..\Utility.psm1

function Install {
    Param ( [string]$Id = "", [string]$Name = "")
    if ($Name -eq "" -Or $Id -eq "") {
        Write-Error "Args not found"
        Exit
    }

    if (Test-Installed $Id) {
        Write-Info "$Name is installed... skipping."
    } else {
        Write-Info "Installing $Name"
        winget install -s winget --silent --id $Id
        if (!$?) {
            Write-Error "Installing $Name is failed."
        }
    }
}

function Upgrade {
    Param ( [string]$Id = "", [string]$Name = "")
    if ($Name -eq "" -Or $Id -eq "") {
        Write-Error "Args not found"
        Exit
    }

    if (Test-Installed $Id) {
        Write-Info "Upgrading $Name"
        winget upgrade -s winget $Id
    } else {
        Write-Error "$Name is not installed... skipping."
    }
}

function Uninstall {
    Param ( [string]$Id = "", [string]$Name = "")
    if ($Name -eq "" -Or $Id -eq "") {
        Write-Error "Args not found"
        Exit
    }

    if (Test-Installed $Id) {
        Write-Info "Uninstall $Name"
        winget uninstall -s winget $Id
    } else {
        Write-Info "$Name is not installed... skipping."
    }
}

function Test-Installed {
    Param ( [string]$Id = "")
    if ($Id -eq "") {
        Write-Error "Args not found"
        Exit
    }

    $info = winget list -s winget $Id
    return $info -Like "*$Id *"
}

Export-ModuleMember -Function Install 
Export-ModuleMember -Function Upgrade 
Export-ModuleMember -Function Uninstall
