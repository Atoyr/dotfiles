#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_patch() {
    if which patch > /dev/null ; then
        info "patch is installed... skipping."
    else
        info "Installing patch"
        apt -y install patch
    fi
}

install_patch

