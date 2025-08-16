#!/usr/bin/env sh
set -euo pipefail
IFS=$'\n'

# 24-hours format
current_hour="$(date "+%H")"

if [ "${current_hour}" -ge 18 ]; then
    echo "Setting system color-scheme to dark..."
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    if [ "$(qs list --all)" != "No running instances." ]; then
        echo "Setting Quickshell theme to dark..."
        qs -c DankMaterialShell ipc call theme dark
    fi
else
    echo "Setting system color-scheme to light..."
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    if [ "$(qs list --all)" != "No running instances." ]; then
        echo "Setting Quickshell theme to light..."
        qs -c DankMaterialShell ipc call theme light
    fi
fi
