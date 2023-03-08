#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_autoconf() {
    if which autoconf > /dev/null ; then
        info "autoconf is installed... skipping."
    else
        info "Installing autoconf"
        apt -y install autoconf
    fi
}

install_autoconf

