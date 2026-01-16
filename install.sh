#!/usr/bin/env bash

DOTFILES="$(pwd)"

source ./scripts/lib/bash/log.sh
source ./scripts/lib/bash/distro.sh
source ./scripts/link/bash/config.sh

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

title() {
    echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

help_message() {
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

get_linkables() {
    find -H "$DOTFILES/config" -maxdepth 3 -name '*'
}


setup_symlinks() {
    title "Creating symlinks"
    link_config
}

remove_symlinks() {
    title "Remove symlinks"

    for file in $(get_configfiles) ; do
        name="$(basename "$file")"
        target="$HOME/.${name//__/\/}"
        if [ -L "$target" ]; then
            info "unlink $file"
            unlink "$target"
        fi
    done
}

install_applications() {
    case $(whichdistro) in
        debian)
            bash ${DOTFILES}/installer/Debian/install.sh 
            bash ${DOTFILES}/installer/Debian/install-ohmyposh.sh 
            bash ${DOTFILES}/installer/Debian/install-lazygit.sh 
            bash ${DOTFILES}/installer/Debian/install-zellij.sh
            # ${DOTFILES}/installer/Debian/install-unzip.sh 
            # ${DOTFILES}/installer/Debian/install-vim.sh 
            ;;
        *)
            error "install command not working"
            ;;
    esac
}

update_apt() {
    info "update apt..."
    sudo apt update
    info "upgrade apt..."
    sudo apt upgrade

    [[ $? ]] && success "$(tput setaf 2) Update apt  complete. ✔︎$(tput sgr0)"
}

change_shell() {

    if [ "`cat /etc/shells | grep '/bin/zsh'`" ]; then
        info "change shell to zsh..."
        chsh -s /bin/zsh
    else
        error "zsh is not installed"
    fi
}

case "$1" in
    apt)
        update_apt
        ;;
    link)
        setup_symlinks
        ;;
    unlink)
        remove_symlinks
        ;;
    app)
        install_applications
        ;;
    chsh)
        change_shell
        ;;
    all)
        setup_symlinks
        install_applications
        change_shell
        ;;
    debug)
        warning "warning"
        info "info"
        success "success"
        error "error"
        exit 1
        ;;
    *)
        exit 1
        ;;
esac

echo -e
success "Done."
