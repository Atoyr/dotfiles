#!/usr/bin/env bash

DOTFILES="$(pwd)"

COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"

BACK_BLUE="\033[1;44m"
BACK_GREEN="\033[1;42m"
BACK_RED="\033[1;41m"
BACK_PURPLE="\033[1;45m"
BACK_YELLOW="\033[1;43m"

COLOR_NONE="\033[0m"

title() {
    echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
    echo -e "${BACK_RED} ERROR ${COLOR_NONE} ${COLOR_RED}$1${COLOR_NONE}"
    exit 1
}

warning() {
    echo -e "${BACK_YELLOW} WARNING ${COLOR_NONE} ${COLOR_YELLOW}$1${COLOR_NONE}"
}

info() {
    echo -e "${BACK_BLUE} INFO ${COLOR_NONE} ${COLOR_BLUE}$1${COLOR_NONE}"
}

success() {
    echo -e "${COLOR_GREEN}$1${COLOR_NONE}"
}

get_linkables() {
    find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}

setup_symlinks() {
    title "Creating symlinks"

    for file in $(get_linkables) ; do
        # Exclusion Setting
        [[ $(basename "$file") = "gvimrc.symlink" ]] && continue

        target="$HOME/.$(basename "$file" '.symlink')"
        if [ -e "$target" ]; then
            info "~${target#$HOME} already exists... Skipping."
        else
            info "Creating symlink for $file"
            ln -s "$file" "$target"
        fi
    done
}

case "$1" in
    link)
        setup_symlinks
        ;;
    all)
        setup_symlinks
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
