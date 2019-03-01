# Powerline
. ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# DISPLAY
export DISPLAY=localhost:0.0

# TMUX
if [ $SHLVL = 1 ]; then
  alias tmux="tmux -2 attach || tmux -2 new \; source-file ~/.config/tmux/config"
fi
tmux && exit
