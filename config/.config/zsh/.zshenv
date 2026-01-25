export TERM=xterm-256color

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR='nvim'

export PATH="${HOME}/bin:$PATH"

for f in "$ZDOTDIR"/zsh.d/*.zsh; do
  [ -r "$f" ] && source "$f"
done

