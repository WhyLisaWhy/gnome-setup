#!/bin/bash

# Moving icons

mv /home/$USER/gnome-setup/logo-svg/Nobara-logo.svg /home/$USER/Pictures/Nobara-logo.svg


# Nobara install
echo -e "\033[1mNobara install Script. Removing unwanted applications...\033[0m"

# package remove
sudo dnf -y remove onlyoffice-desktopeditors blender obs-studio kdenlive inkscape cheese rhythmbox totem gnome-photos oeg

echo -e "\033[1mRemoval complete. Updating System...\033[0m"

# system update
sudo dnf upgrade -y
flatpak update -y

# dual boot time sync

timedatectl set-local-rtc 1

echo -e "\033[1mSystem update comeplete. Installing wanted applications...\033[0m"

# package install
sudo dnf -y install libreoffice ffmpegthumbnailer gthumb yaru-theme cabextract xorg-x11-font-utils deja-dup fish pycharm-community

# change default shell to fish
chsh -s /usr/bin/fish

# noisetorch

echo -e "\033[1mInstall complete. Installing noisetorch.\033[0m"

curl -# https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz

tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz

gtk-update-icon-cache

sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch

echo -e "\033[1mInstall complete. Installing flatpaks.\033[0m"

flatpak install flathub com.visualstudio.code -y

echo -e "\033[1mInstall complete.\033[0m"





