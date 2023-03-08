#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_automake() {
    if which automake > /dev/null ; then
        info "automake is installed... skipping."
    else
        info "Installing automake"
        apt -y install automake
    fi
}

install_automake

