#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install() {
    local -a desired_formulae=(
    'autoconf'
    'automake'
    'curl'
    'git'
    'unzip'
    'openssl'
    'patch'
    'tig'
    'tmux'
    'zsh'
    )

    for index in ${!desired_formulae[*]}
    do
        local formula=`echo ${desired_formulae[$index]} | cut -d' ' -f 1`
        if which ${formula} > /dev/null ; then
            info "${formula} is installed... skipping."
        else
            info "Installing ${formula}"
            sudo apt -y install ${formula}
            [[ $? ]] && success "$(tput setaf 2) Installed ${formula} ✔︎$(tput sgr0)"
        fi
    done

    info "autoremove Package..."
    sudo apt -y autoremove
    [[ $? ]] && success "$(tput setaf 2) autoremove complete. ✔︎$(tput sgr0)"
}

install
