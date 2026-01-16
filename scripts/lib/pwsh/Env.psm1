function Set-UserEnvironmentVariable {
    Write-Info "Set User environment variable."
    [Environment]::SetEnvironmentVariable('XDG_CONFIG_HOME', "$env:USERPROFILE\.config", 'User')
    [Environment]::SetEnvironmentVariable('XDG_DATA_HOME', "$env:USERPROFILE\.local\share", 'User')
}

