
Param ( [string]$Flag = "")

function Title {
    Param ( [string]$arg = "")
    Write-Host $arg -ForegroundColor Magenta
    Write-Host "==============================" -ForegroundColor Gray
}

function Write-Error {
    Param ( [string]$msg = "")
    Write-Host " ERROR " -NoNewline -BackgroundColor DarkRed
    Write-Host " " -NoNewline
    Write-Host $msg -ForegroundColor DarkRed
}

function Write-Warning {
    Param ( [string]$msg = "")
    Write-Host " WARNING " -NoNewline -BackgroundColor DarkYellow
    Write-Host " " -NoNewline
    Write-Host $msg -ForegroundColor DarkYellow
}

function Write-Info {
    Param ( [string]$msg = "")
    Write-Host " INFO " -NoNewline -BackgroundColor DarkCyan
    Write-Host " " -NoNewline
    Write-Host $msg -ForegroundColor DarkCyan
}

function Write-Success {
    Param ( [string]$msg = "")
    Write-Host $msg -ForegroundColor DarkGreen
}

function Write-Help {
    Write-Host ""
    Write-Host "link    :Setup Symbolic Links"
    Write-Host "choco   :Setup Chocolatey"
}

# creating symbolic link
function Setup-SymbolicLinks {
    Title "Creating symlinks"

    New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\vimfiles\vimrc" -Target "$env:USERPROFILE\dotfiles\config\vimrc.symlink"
    New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\vimfiles\gvimrc" -Target "$env:USERPROFILE\dotfiles\config\gvimrc.symlink"
}

switch ($Flag)
{
    "link" {
        Setup-SymbolicLinks
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

