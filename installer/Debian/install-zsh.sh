#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_zsh() {
    if which zsh > /dev/null ; then
        info "zsh is installed... skipping."
    else
        info "Installing zsh"
        apt -y install zsh
    fi
}

install_zsh
