. ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# TMUX
SESSION_NAME=default

if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
  option=""
  if tmux has-session -t ${SESSION_NAME}; then
    option="attach -t ${SESSION_NAME}"
  else
    option="new -s ${SESSION_NAME}"
  fi  
  tmux $option && exit
fi
