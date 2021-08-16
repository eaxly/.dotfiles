#!/usr/bin/env bash

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start --components=ssh,secrets,pkcs11)
    export SSH_AUTH_SOCK
fi
