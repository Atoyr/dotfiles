autoload -Uz compinit
compinit

# miseを読み込まないとツールが使えないため
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

for f in ~/.config/zsh/zshrc.d/*.zsh; do
  [ -r "$f" ] && source "$f"
done

