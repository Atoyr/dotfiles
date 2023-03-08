#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_alacritty() {
    if which alacritty > /dev/null ; then
        info "alacritty is installed... skipping."
    else
        info "Installing alacritty"
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        rustup override set stable
        rustup update stable
    fi
}

install_alacritty
