#!/usr/bin/env bash

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

