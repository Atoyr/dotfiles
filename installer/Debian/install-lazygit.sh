#!/usr/bin/env bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../utility.sh

install_lazygit() {
    if which lazygit > /dev/null ; then
        info "lazygit is installed... skipping."
    else
        info "Installing lazygit"

        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin

        rm lazygit.tar.gz
        rm lazygit -rf
    fi
}

install_lazygit
