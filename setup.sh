#!/bin/bash 
DOT_DIRECTORY="${HOME}/dotfiles"

usage() {
  name=`basename $0`
    cat <<EOF
Usage:
  $name [arguments] [command]
Commands:
  deploy
  initialize
Arguments:
  -f $(tput setaf 1)** warning **$(tput sgr0) Overwrite dotfiles.
  -h Print help (this message)
EOF
  exit 1
}

cd ${DOT_DIRECTORY}
source ./etc/lib/pacman

initialize() {
  if type "pacman" > /dev/null 2>&1 ; then
    run_pacman
  elif type "apt" > /dev/null 2>&1 ; then
    run_apt
  fi
}

deploy() {
  for f in .??*
  do
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = ".config" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
  done
  echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
}

undeploy() {
  for f in .??*
  do
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = ".config" ]] && continue
    unlink ${HOME}/${f}
  done
  echo $(tput setaf 2)undeploy dotfiles complete!. ✔︎$(tput sgr0)

}

command=$1
[ $# -gt 0 ] && shift

case $command in 
  deploy)
    deploy
    ;;
  undeploy)
    undeploy
    ;;
  init*)
    initialize
    ;;
  *)
    usage
    ;;
esac

exit 0
