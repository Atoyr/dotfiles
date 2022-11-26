
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
