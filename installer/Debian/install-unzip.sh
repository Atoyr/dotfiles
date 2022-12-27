#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_unzip() {
    if which unzip > /dev/null ; then
        info "unzip is installed... skipping."
    else
        info "Installing unzip"
        apt -y install unzip
    fi
}

install_unzip
