#!/bin/bash
run_apt() {
    echo "Updating apt..."
    sudo apt update
    sudo apt upgrade
    [[ $? ]] && echo "$(tput setaf 2) Update apt  complete. ✔︎$(tput sgr0)"

    local list_formulae
    local -a missing_formulae
    local -a desired_formulae=(
    'autoconf'
    'automake'
    'git'
    'openssl'
    'patch'
    'tig'
    'tmux'
    'zsh'
    )

    local installed=$(apt install >&1 | grep -v deinstall | awk -F/ '{print $1}')

    for index in ${!desired_formulae[*]}
    do
      local formula=`echo ${desired_formulae[$index]} | cut -d' ' -f 1`
      if [[ -z `echo "${installed}" | grep "^${formula}$"` ]]; then
        missing_formulae=("${missing_formulae[@]}" "${desired_formulae[$index]}")
      else
        echo "Installed ${formula}"
      fi
    done
    if [[ "$missing_formulae" ]]; then
      list_formulae=$( printf "%s " "${missing_formulae[@]}" )

      echo "Installing missing package formulae..."
      sudo apt-get install $list_formulae

      [[ $? ]] && echo "$(tput setaf 2)Installed missing formulae ✔︎$(tput sgr0)"
    fi

    echo "autoremove Package..."
    sudo apt autoremove
    [[ $? ]] && echo "$(tput setaf 2) autoremove complete. ✔︎$(tput sgr0)"
}
