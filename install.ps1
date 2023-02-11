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
    Write-Host "all       : Setup and install all applications."
    Write-Host "env       : Setup user environment variable."
    Write-Host "link      : Setup symbolic links."
    Write-Host "app       : Install applications."
    Write-Host "dev       : Install develolper applications."
    Write-Host "personal  : Install personal applications."
    Write-Host "font      : Install fonts."
}

function Set-UserEnvironmentVariable {
    Write-Info "Set User environment variable."
    [Environment]::SetEnvironmentVariable('XDG_CONFIG_HOME', '%USERPROFILE%\.config', 'User')
    [Environment]::SetEnvironmentVariable('XDG_DATA_HOME', '%USERPROFILE%\.local\share', 'User')
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
    $symbolicLinks.Add("config\vimrc.symlink", @{"Path" = "$HOME\vimfiles\vimrc"; "Force" = $false})
    $symbolicLinks.Add("config\gvimrc.symlink", @{"Path" = "$HOME\vimfiles\gvimrc"; "Force" = $false})
    $symbolicLinks.Add("config\nvim_init.lua.symlink", @{"Path" = "$HOME\.config\nvim\init.lua"; "Force" = $false})
    $symbolicLinks.Add("config\nvim_lua_plugins.lua.symlink", @{"Path" = "$HOME\.config\nvim\lua\plugins.lua"; "Force" = $false})
    $symbolicLinks.Add("config\nvim_lua_powerline.lua.symlink", @{"Path" = "$HOME\.config\nvim\lua\powerline.lua"; "Force" = $false})
    $symbolicLinks.Add("config\Microsoft.PowerShell_profile.ps1.symlink", @{"Path" = "$PROFILE"; "Force" = $false})
    $symbolicLinks.Add("config\WindowsTerminal.settings.json.symlink", @{"Path" = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"; "Force" = $true})

    foreach($target in $symbolicLinks.Keys){
        $symbolicLink = $symbolicLinks[$target]
        $symbolicLinkPath = $symbolicLink.Path
        $symbolicLinkDir = Split-Path $symbolicLinkPath
        if (!(Test-Path $symbolicLinkDir)) {
            Write-Info "Creating directory for $symbolicLinkDir"
            New-Item -Path $symbolicLinkDir -Type Directory -Force > $null
        }
        if (Test-Path $symbolicLinkPath) {
            if ($symbolicLink.Force)
            {
                Write-info "Overwriting $symbolicLinkPath with symlink file"
                New-Item -ItemType SymbolicLink -Path $symbolicLinkPath -Target $target -Force > $null
            } else {
                Write-Info "$symbolicLinkPath already exists... Skipping."
            }
        } else {
            Write-info "Creating symlink for $symbolicLinkPath"
            New-Item -ItemType SymbolicLink -Path $symbolicLinkPath -Target $target > $null
        }
    }
}

function Set-MyExecutionPolicy {
    Title "Set ExecutionPolicy"
    Write-Info "Set ExecutionPolicy to RemoteSigned"
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
}

function Install-Fonts {
    Title "Install Fonts"

    .\installer\Windows\Install-Fonts.ps1
}

# Install Application
function Install-Applications {
    Title "Install Applications"

    if(!$isAdmin)
    {
        Write-Error "Please run with administrator privileges"
        Exit
    }

    Write-Info "Installing PSReadLine"
    Install-Module PSReadLine -Confirm:$false -Force 
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

    .\installer\Windows\Install-Vim.ps1 install
    .\installer\Windows\Install-VisualStudioCode.ps1 install
    .\installer\Windows\Install-WinMerge.ps1 install
    .\installer\Windows\Install-GitHubCLI.ps1 install
    .\installer\Windows\Install-AWSCli.ps1 install
    .\installer\Windows\Install-AzureCli.ps1 install
    .\installer\Windows\Install-AzureStorageExplorer.ps1 install
    .\installer\Windows\Install-SSMS.ps1 install

    # reload Path
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Install Personal Applications
function Install-PersonalApplications {
    Title "Install Personal Applications"

    if(!$isAdmin)
    {
        Write-Error "Please run with administrator privileges"
        Exit
    }

    .\installer\Windows\Install-PowerToys.ps1 install
    .\installer\Windows\Install-1password.ps1 install
    .\installer\Windows\Install-Slack.ps1 install
    .\installer\Windows\Install-Notion.ps1 install
    .\installer\Windows\Install-Discord.ps1 install
    .\installer\Windows\Install-ScreenToGif.ps1 install
    .\installer\Windows\Install-OhMyPosh.ps1 install

    # reload Path
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    . $PROFILE
}

switch ($Flag) {
    "env" {
        Set-UserEnvironmentVariable
    }
    "link" {
        Setup-SymbolicLinks
        Set-MyExecutionPolicy
        break
    }
    "app" {
        Install-Applications
        break
    }
    "dev" {
        Install-DevApplications
    }
    "personal" {
        Install-PersonalApplications
    }
    "font" {
        Install-Fonts
    }
    "all" {
        Setup-SymbolicLinks
        Set-MyExecutionPolicy
        Install-Fonts
        Install-Applications
        Install-DevApplications
        Install-PersonalApplications
        break;
    }
    default {
        Write-Help
        Exit;
    }
}

Write-Success "done."
