#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_vim() {
    if which vim > /dev/null ; then
        info "Vim is installed... skipping."
    else
        info "Installing Vim"
        apt -y install vim
    fi
}

install_vim
