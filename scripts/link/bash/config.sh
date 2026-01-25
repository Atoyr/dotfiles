#!/usr/bin/env bash

source ../../lib/bash/log.sh

link_config() {

  local src="$ROOT_DIR/config"
  local dest="$HOME"

  create_symlink "$src/.zshenv" "$dest/.zshenv"
  create_symlink "$src/.config/zsh" "$dest/.config/zsh"
  create_symlink "$src/.config/nvim" "$dest/.config/nvim"
  create_symlink "$src/.config/mise" "$dest/.config/mise"
  create_symlink "$src/.config/zellij" "$dest/.config/zellij"
  create_symlink "$src/.config/wezterm" "$dest/.config/wezterm"
}

create_symlink() {
  local from="$1"
  local to="$2"
  info "Creating symlink $from -> $to"
  ln -snf "$from" "$to"
}

