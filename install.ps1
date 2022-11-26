Param ( [string]$Flag = "")

Import-Module .\Utility.psm1

function Title {
    Param ( [string]$arg = "")
    Write-Host $arg -ForegroundColor Magenta
    Write-Host "==============================" -ForegroundColor Gray
}


function Write-Help {
    Write-Host ""
    Write-Host "link    : Setup Symbolic Links"
    Write-Host "app     : Install Applications"
}

# creating symbolic link
function Setup-SymbolicLinks {
    Title "Creating symlinks"

    New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\vimfiles\vimrc" -Target "$env:USERPROFILE\dotfiles\config\vimrc.symlink"
    New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\vimfiles\gvimrc" -Target "$env:USERPROFILE\dotfiles\config\gvimrc.symlink"
}

# Install Application
function Install-Applications {
    Title "Install Applications"

    .\installer\Windows\Install-Vim.ps1 install
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
    "all" {
        Write-Host "All"
        break;
    }
    "debug" {
        Write-Error "Error Message"
        Write-Warning "Warning Message"
        Write-Info "Info Message"
        Write-Success "Success Message"
        Exit;
    }
    default {
        Write-Help
        Exit;
    }
}

Write-Success "done."
