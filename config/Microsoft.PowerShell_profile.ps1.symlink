if ($env:WT_PROFILE_ID -or $env:ALACRITTY_LOG) {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\tokyo.omp.json" | Invoke-Expression
}
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord


Set-Alias vim 'C:\Program Files\vim\vim90\vim.exe'
Set-Alias nvim 'C:\Program Files\Neovim\bin\nvim.exe'

function Set-LocationSrc { cd ~/src }
Set-Alias src Set-LocationSrc

function Set-GitBranch {
  param($branchName)
  git fetch
  if ($branchName -eq "") {
    git branch -a
  } else {
    git switch -c $branchName origin/$branchName
  }
}
Set-Alias gbranch Set-GitBranch

Set-Alias g 'git'
Set-Alias git-log 'git log --pretty=format:"%h - %ad : %s"'
