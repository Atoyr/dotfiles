function Set-MyExecutionPolicy {
    Title "Set ExecutionPolicy"
    Write-Info "Set ExecutionPolicy to RemoteSigned"
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
}

