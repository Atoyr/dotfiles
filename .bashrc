# Powerline
# . ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# DISPLAY
export DISPLAY=localhost:0.0

export GOPATH=$HOME

alias vivi='vim ~/.vimrc'
alias g='git'
alias git-log='git log --pretty=format:"%h - %ad : %s"'

# TMUX
# if [ $SHLVL = 1 ]; then
#   alias tmux="tmux -2 attach || tmux -2 new \; source-file ~/.config/tmux/config"
# fi
## tmux && exit

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $? -jobs $(jobs -p | wc -l))"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.
    
    #set "?"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
