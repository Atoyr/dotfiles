#!/bin/bash

source $(dirname "${BASH_SOURCE[0]:-$0}")/../../lib/bash/log.sh

# 共通ツール
packages=(
    'autoconf'
    'automake'
    'curl'
    'git'
    'unzip'
    'openssl'
    'patch'
    'tig'
    'zsh'
    'zsh-syntax-highlighting'
)

install_common() {
    info "install common packages"
    sudo apt update
    sudo apt install -y "${packages[@]}"
}

