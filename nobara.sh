#!/bin/bash

# Nobara install
echo "Nobara install Script. Removing trash..."

# package remove
sudo dnf -y remove onlyoffice-desktopeditors blender obs-studio kdenlive inkscape cheese rhythmbox totem gnome-photos oeg

echo "Trash taken out. Updating System..."

# system update
sudo dnf upgrade -y
flatpak update -y

# dual boot time sync

timedatectl set-local-rtc 1

echo "System update comeplete. Installing apps..."

# package install
sudo dnf -y install libreoffice ffmpegthumbnailer gthumb yaru-theme cabextract xorg-x11-font-utils
echo "Install complete."