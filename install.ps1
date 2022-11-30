Param ( [string]$Flag = "")
Import-Module .\Utility.psm1

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

function Title {
    Param ( [string]$arg = "")
    Write-Host $arg -ForegroundColor Magenta
    Write-Host "==============================" -ForegroundColor Gray
}


function Write-Help {
    Write-Host "DOTFILES"
    Write-Host "all     : Setup and install"
    Write-Host "link    : Setup Symbolic Links"
    Write-Host "app     : Install Applications"
}

# creating symbolic link
function Setup-SymbolicLinks {
    Title "Creating symlinks"

    if(!$isAdmin)
    {
        Write-Error "Please run with administrator privileges"
        Exit
    }

    # target , path
    $symbolicLinks = [ordered]@{}
    $symbolicLinks.Add("config\vimrc.symlink", "$env:USERPROFILE\vimfiles\vimrc")
    $symbolicLinks.Add("config\gvimrc.symlink", "$env:USERPROFILE\vimfiles\gvimrc")

    foreach($target in $symbolicLinks.Keys){
        $symbolicLinkPath = $symbolicLinks[$target]
        if (Test-Path $symbolicLinkPath) {
            Write-Info "$symbolicLinkPath already exists... Skipping."
        } else {
            Write-info "Creating symlink for $symbolicLinkPath"
            New-Item -ItemType SymbolicLink -Path $symbolicLinkPath -Target $target > $null
        }
    }
}

# Install Application
function Install-Applications {
    Title "Install Applications"

    if(!$isAdmin)
    {
        Write-Error "Please run with administrator privileges"
        Exit
    }

    .\installer\Windows\Install-Vim.ps1 install
    .\installer\Windows\Install-WindowsTerminal.ps1 install
    .\installer\Windows\Install-Chrome.ps1 install
    .\installer\Windows\Install-7Zip.ps1 install
    .\installer\Windows\Install-gsudo.ps1 install

    # reload Path
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Install Developer tools
function Install-DevApplications {
    Title "Install Developer Applications"

    if(!$isAdmin)
    {
        Write-Error "Please run with administrator privileges"
        Exit
    }

    .\installer\Windows\Install-GitHubCLI.ps1 install

    # reload Path
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

switch ($Flag) {
    "link" {
        Setup-SymbolicLinks
        break
    }
    "app" {
        Install-Applications
        break
    }
    "dev" {
        Install-DevApplications
    }
    "all" {
        Setup-SymbolicLinks
        Install-Applications
        break;
    }
    default {
        Write-Help
        Exit;
    }
}

Write-Success "done."
