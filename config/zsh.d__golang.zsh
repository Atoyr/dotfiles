# golang setting
if [ -d /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:~/go/bin
fi

if [ -d $HOME/.goenv ]; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$GOENV_ROOT/bin:$PATH"
  eval "$(goenv init -)"
fi

