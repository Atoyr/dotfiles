#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_zellij() {
    if which zellij > /dev/null ; then
        info "zellij is installed... skipping."
    elif which cargo > /dev/null ; then
        info "Installing zellij"
        cargo install --locked zellij
    else
        warning "cargo is not installed... skipping."
    fi
}

install_zellij

