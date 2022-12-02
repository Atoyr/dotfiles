Import-Module $PSScriptRoot\..\..\Utility.psm1

$SourceDir   = "$PSScriptRoot\..\..\fonts\"
$Source      = "$SourceDir\*"
$Destination = (New-Object -ComObject Shell.Application).Namespace(0x14)

function Install {
    New-Item -ItemType Directory -Force -Path $SourceDir > $null
    Write-Info "Download CascadinaCode Font."
    Invoke-DownloadAndUnzip "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0-RC/CascadiaCode.zip"
    Write-Info "Download Cica Font."
    Invoke-DownloadAndUnzip "https://github.com/miiton/Cica/releases/download/v5.0.3/Cica_v5.0.3.zip"

    Get-ChildItem -Path $Source -Include '*.ttf','*.ttc','*.otf' -Recurse | ForEach {
        if ((Test-Path "C:\Windows\Fonts\$($_.Name)") `
            -Or (Test-Path "$env:LOCALAPPDATA\Microsoft\Windows\Fonts\$($_.Name)")) {
            Write-Info "$($_.Name) is installed... skipping."
        } else {
            # Install font
            Write-Info "Install $($_.Name)"
            $Destination.CopyHere($_.FullName,0x10)
        }
    }
}

function Invoke-DownloadAndUnzip {
    Param ( [string]$Url = "")

    $DownloadZipFile = $SourceDir + $(Split-Path -Path $Url -Leaf)
    Invoke-WebRequest -Uri "$Url" -OutFile "$DownloadZipFile"
    Expand-Archive -LiteralPath $DownloadZipFile -DestinationPath $SourceDir
}

Install
