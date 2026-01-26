autoload -Uz compinit
compinit

for f in ~/.config/zsh/zshrc.d/*.zsh; do
  [ -r "$f" ] && source "$f"
done

