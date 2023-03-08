#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_curl() {
    if which curl > /dev/null ; then
        info "curl is installed... skipping."
    else
        info "Installing curl"
        apt -y install curl
    fi
}

install_curl
