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

# noisetorch

echo "Installing noisetorch."

curl -# https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz

tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz

gtk-update-icon-cache

sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch

echo "Install complete."