#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_tmux() {
    if which tmux > /dev/null ; then
        info "tmux is installed... skipping."
    else
        info "Installing tmux"
        apt -y install tmux
    fi
}

install_tmux

