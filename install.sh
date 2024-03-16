#!/usr/bin/env bash

DOTFILES="$(pwd)"

source ./utility.sh


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

get_configfiles() {
    for file in $(get_linkables) ; do
        # ファイル名を取得
        basename=$(basename "$file")

        # 除外するファイル名をチェック
        [[ $basename = "gvimrc" ]] && continue
        [[ $basename = "Microsoft.PowerShell_profile.ps1" ]] && continue
        [[ $basename = "WindowsTerminal.settings.json" ]] && continue
        [[ $basename = "appdata__Rowming__alacritty__alacritty.yaml" ]] && continue
        [[ $basename = "luarc.json" ]] && continue

        # 除外されていないファイルを出力
        echo "$file"
    done
}

setup_symlinks() {
    title "Creating symlinks"

    for file in $(get_configfiles) ; do
        name="$(basename "$file")"
        target="$HOME/.${name//__/\/}"

        if [ -L "$target" ]; then
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
