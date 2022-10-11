#!/bin/bash

# Nobara install
echo -e "\033[1mNobara install Script. Removing unwanted applications...\033[0m"

# package remove
sudo dnf -y remove onlyoffice-desktopeditors cheese rhythmbox totem gnome-photos eog

echo -e "\033[1mRemoval complete. Updating System...\033[0m"

# system update
sudo dnf upgrade -y
flatpak update -y

# dual boot time sync

timedatectl set-local-rtc 1

echo -e "\033[1mSystem update comeplete. Installing wanted applications...\033[0m"

# package install 
sudo dnf -y install util-linux-user pip libreoffice ffmpegthumbnailer gthumb yaru-theme cabextract xorg-x11-font-utils deja-dup fish python3-evdev gtksourceview4 python3-devel python3-pydantic python3-pydbus
sudo dnf group upgrade -y --with-optional Multimedia
sudo dnf install -y 'google-roboto*' 'mozilla-fira*' fira-code-fonts

#input remapper
sudo pip install --no-binary :all: git+https://github.com/sezanzeb/input-remapper.git
sudo systemctl enable input-remapper
sudo systemctl restart input-remapper

# veracrypt
wget "https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-CentOS-8-x86_64.rpm"
sudo dnf install veracrypt-1.25.9-CentOS-8-x86_64.rpm -y

# noisetorch

echo -e "\033[1mInstall complete. Installing noisetorch.\033[0m"

wget https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz

tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz

gtk-update-icon-cache

sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch

echo -e "\033[1mInstall complete. Installing flatpaks. This may take a while...\033[0m"

#vs code
flatpak install flathub com.visualstudio.code -y

#pycharm
flatpak install flathub com.jetbrains.PyCharm-Community -y

#discord
flatpak install flathub com.discordapp.Discord -y

echo -e "\033[1mInstall complete. Moving files...\033[0m"

# Moving Nobara icon to Pictures directory for dash-to-panel
mv /home/$USER/gnome-setup/logo-svg/Nobara-logo.svg /home/$USER/Pictures/Nobara-logo.svg

echo -e "\033[1mInstall complete. Disabling unwanted gnome extensions, enabling wanted gnome extensions...\033[0m"

#desktop icons
gnome-extensions disable ding@rastersoft.com 

#arc menu
gnome-extensions disable arcmenu@arcmenu.com

#gsconnect
gnome-extensions enable gsconnect@andyholmes.github.io

#openweather
gnome-extensions enable openweather-extension@jenslody.de

# change default shell to fish
chsh -s /usr/bin/fish

