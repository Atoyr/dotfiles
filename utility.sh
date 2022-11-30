#!/usr/bin/env bash

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

whichdistro() {
    if [ -f /etc/debian_version ]; then
        echo debian
        return
    elif [ -f /etc/arch-release ]; then
        echo arch
        return
    elif [ -f /etc/fedora-release ]; then
        echo redhat
        return
    elif [ -f /etc/redhat-release ]; then
        echo redhat
        return
    elif [ -f /etc/alpine-release ]; then
        echo alpine
        return
    fi
    echo unknown
    return
}
