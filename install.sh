#!/usr/bin/env bash

DOTFILES="$(pwd)"

source ./utility.sh


title() {
    echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}


get_linkables() {
    find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}

setup_symlinks() {
    title "Creating symlinks"

    for file in $(get_linkables) ; do
        # Exclusion Setting
        [[ $(basename "$file") = "gvimrc.symlink" ]] && continue
        [[ $(basename "$file") = "Microsoft.PowerShell_profile.ps1.symlink" ]] && continue

	name="$(basename "$file" '.symlink')"
        target="$HOME/.${name//_/\/}"
        if [ -e "$target" ]; then
            info "~${target#$HOME} already exists... Skipping."
        else
		if [ ! -d "$(dirname ${target})" ]; then
			info "Creating directory for $(dirname ${target})"
			mkdir -p $(dirname ${target})
		fi
		info "Creating symlink for $file"
		ln -s "$file" "$target"
        fi
    done
}

install_applications() {
    case $(whichdistro) in
        debian)
            ${DOTFILES}/installer/Debian/install-unzip.sh 
            ${DOTFILES}/installer/Debian/install-vim.sh 
            ;;
        *)
            error "install command not working"
            ;;
    esac
}

case "$1" in
    link)
        setup_symlinks
        ;;
    app)
        install_applications
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
