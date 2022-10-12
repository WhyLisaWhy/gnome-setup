#!/bin/bash

# Text Color
BLU='\033[1;34m'
NC='\033[0m' # No Color

# Distro choice
echo "What is your Distro:
1) Nobara OS
2) Pop OS"

# user distro input
read -p "Select a number: " DISTRO

if [ "$DISTRO" == "1" ]
then

# Nobara install
echo -e "\033[1m{BLU}Nobara install Script. Removing unwanted applications...{NC}\033[0m"

# package remove
sudo dnf -y remove onlyoffice-desktopeditors cheese rhythmbox totem gnome-photos eog

echo -e "\033[1m{BLU}Removal complete. Updating System...{NC}\033[0m"

# system update
sudo dnf upgrade -y
flatpak update -y

echo -e "\033[1m{BLU}System update comeplete. Installing wanted applications...{NC}\033[0m"

# package install 
sudo dnf -y install util-linux-user pip libreoffice ffmpegthumbnailer 'google-roboto*' 'mozilla-fira*' fira-code-fonts gthumb yaru-theme cabextract xorg-x11-font-utils deja-dup fish python3-evdev gtksourceview4 python3-devel python3-pydantic python3-pydbus
sudo dnf group upgrade -y --with-optional Multimedia

# veracrypt
wget "https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-CentOS-8-x86_64.rpm"
sudo dnf install veracrypt-1.25.9-CentOS-8-x86_64.rpm -y

#input remapper
echo -e "\033[1m{BLU}Install complete. Installing input remapper.{NC}\033[0m"
sudo pip install --no-binary :all: git+https://github.com/sezanzeb/input-remapper.git
sudo systemctl enable input-remapper
sudo systemctl restart input-remapper

echo -e "\033[1m{BLU}Install complete. Moving files...{NC}\033[0m"

# Moving Nobara icon to Pictures directory for dash-to-panel
sudo mv $HOME/gnome-setup/logo-svg/Nobara-logo.svg /usr/share/icons/dash-to-panel/Dash-to-panel-icon.svg

echo -e "\033[1m{BLU}Install complete. Disabling unwanted gnome extensions, enabling wanted gnome extensions...{NC}\033[0m"

#arc menu
gnome-extensions disable arcmenu@arcmenu.com

#gsconnect
gnome-extensions enable gsconnect@andyholmes.github.io

#openweather
gnome-extensions enable openweather-extension@jenslody.de

elif [ "$DISTRO" == "2" ]
then

# Pop OS install
echo -e "\033[1m{BLU}Pop OS install Script. Removing unwanted applications...{NC}\033[0m"

# package remove
sudo apt-get remove cheese rhythmbox totem gnome-photos eog vim -y

echo -e "\033[1m{BLU}Removal complete. Updating System...{NC}\033[0m"

# system update
sudo apt-get update && sudo apt-get full-upgrade -y
flatpak update -y

echo -e "\033[1m{BLU}System update comeplete. Installing wanted applications...{NC}\033[0m"

# package install 
sudo apt-get install -y pip ffmpegthumbnailer gthumb cabextract deja-dup fish python3-evdev python3-pydantic python3-pydbus ubuntu-restricted-extras

# veracrypt
wget "https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb"
sudo apt-get install $HOME/gnome-setup/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb -y

# input remapper
wget "https://github.com/sezanzeb/input-remapper/releases/download/1.5.0/input-remapper-1.5.0_all.deb"
sudo apt-get install /home/$USER/gnome-setup/input-remapper-1.5.0.all.deb -y

# extension manager flatpak
flatpak install flathub com.mattjakeman.ExtensionManager -y

# Moving POP icon to Pictures directory for dash-to-panel
sudo mv $HOME/gnome-setup/logo-svg/Pop-os-logo.svg /usr/share/icons/dash-to-panel/Dash-to-panel-icon.svg

echo -e "\033[1m{BLU}Install complete. Disabling unwanted gnome extensions...{NC}\033[0m"

# cosmic dock
gnome-extensions disable cosmic-dock@system76.com 
    
# cosmic workspaces
gnome-extensions disable cosmic-workspaces@system76.com

# pop cosmic
gnome-extensions disable pop-cosmic@system76.com

 
else
    echo "Choose 1 or 2 retard"
fi

echo -e "\033[1m{BLU}Install complete. Installing flatpaks. This may take a while...{NC}\033[0m"

#vs code
flatpak install flathub com.visualstudio.code -y

#pycharm
flatpak install flathub com.jetbrains.PyCharm-Community -y

#discord
flatpak install flathub com.discordapp.Discord -y

# noisetorch
echo -e "\033[1m{BLU}Install complete. Installing noisetorch.{NC}\033[0m"

wget https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz

tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz

gtk-update-icon-cache

sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch

# dual boot time sync
timedatectl set-local-rtc 1

# Moving FISH config file
echo -e "\033[1m{BLU}Moving files.{NC}\033[0m"
mv $HOME/gnome-setup/configs/config.fish $HOME/.config/fish

# change default shell to fish
chsh -s /usr/bin/fish

#desktop icons
gnome-extensions disable ding@rastersoft.com 

echo -e "\033[1m{BLU}COMPLETE.{NC}\033[0m"
