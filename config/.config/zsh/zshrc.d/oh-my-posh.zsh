if command -v oh-my-posh >/dev/null 2>&1; then
  eval "$(oh-my-posh init zsh --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/tokyo.omp.json')"
  source $HOME/.oh-my-posh/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $HOME/.oh-my-posh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

