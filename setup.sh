#!/bin/bash

# Text Color
BLU="\e[1;96m" # Bold Blue
RED="\e[1;31m" # Bold Red
NC="\e[0m" # No Color

# Get the Real Username
RUID=$(who | awk 'FNR == 1 {print $1}')

# Translate Real Username to Real User ID
RUSER_UID=$(id -u ${RUID})

# Distro choice
echo "What is your Distro:
1) Nobara OS
2) Pop OS"

# user distro input
read -p "Select a number: " DISTRO

if [ "$DISTRO" == "1" ]
then

    # Nobara install
    echo -e "${BLU}Nobara install Script. Removing unwanted applications...${NC}"

    # package remove
    sudo dnf -y remove onlyoffice-desktopeditors cheese rhythmbox totem gnome-photos eog

    echo -e "${BLU}Removal complete. Updating System...${NC}"

    # system update
    sudo dnf upgrade -y
    flatpak update -y

    echo -e "${BLU}System update comeplete. Installing wanted applications...${NC}"

    # package install
    sudo dnf -y install util-linux-user pip libreoffice ffmpegthumbnailer 'google-roboto*' 'mozilla-fira*' fira-code-fonts gthumb timeshift yaru-theme cabextract xorg-x11-font-utils pam-u2f pamu2fcfg deja-dup fish python3-evdev gtksourceview4 python3-devel python3-pydantic python3-pydbus
    sudo dnf group upgrade -y --with-optional Multimedia

    # veracrypt
    echo -e "${BLU}Install complete. Installing veracrypt.${NC}"
    wget "https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-CentOS-8-x86_64.rpm"
    sudo dnf install veracrypt-1.25.9-CentOS-8-x86_64.rpm -y

    # input remapper
    echo -e "${BLU}Install complete. Installing input remapper.${NC}"
    sudo pip install --no-binary :all: git+https://github.com/sezanzeb/input-remapper.git
    sudo systemctl enable input-remapper
    sudo systemctl restart input-remapper

    # onedrive
    echo -e "${BLU}Install complete. Installing onedriver.${NC}"
    sudo dnf copr enable jstaf/onedriver -y
    sudo dnf install onedriver -y

    # Moving Nobara icon to Pictures directory for dash-to-panel
    echo -e "${BLU}Install complete. Moving files...${NC}"
    sudo mv $HOME/gnome-setup/logo-svg/Nobara-logo.svg /usr/share/icons/Dash-to-panel-icon.svg
    
    # hostname
    echo -e "${BLU}Files moved to correct locations. Setting hostname...${NC}"
    sudo hostnamectl set-hostname nobara-5800x

    echo -e "${BLU}Install complete. Disabling unwanted gnome extensions, enabling wanted gnome extensions...${NC}"

    # arc menu
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gnome-extensions disable arcmenu@arcmenu.com

    # gsconnect
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gnome-extensions enable gsconnect@andyholmes.github.io

    # openweather
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gnome-extensions enable openweather-extension@jenslody.de
    
    # applying yaru icons
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface icon-theme Yaru-blue-dark
    
    # applying yaru cursor
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface cursor-theme Yaru
    
    # clock settings
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface clock-show-weekday 
    
    # legacy application theme
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme Yaru-blue-dark
    
    # sound theme setting
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.sound theme-name Yaru
    
    # increase parallel download
    sudo sed -i 's/max_parallel_downloads=6/max_parallel_downloads=10/' /etc/dnf/dnf.conf
    
    # default dnf to yes
    echo defaultyes=True | sudo tee -a /etc/dnf/dnf.conf

elif [ "$DISTRO" == "2" ]
then

    # Pop OS install
    echo -e "${BLU}Pop OS install Script. Removing unwanted applications...${NC}"

    # package remove
    sudo apt-get remove cheese rhythmbox totem gnome-photos eog vim -y

    echo -e "${BLU}Removal complete. Updating System...${NC}"

    # system update
    sudo apt-get update && sudo apt-get full-upgrade -y
    flatpak update -y

    echo -e "${BLU}System update comeplete. Installing wanted applications...${NC}"

    # package install
    sudo apt-get install -y pip ffmpegthumbnailer gthumb cabextract pam-u2f pamu2fcfg deja-dup fish python3-evdev python3-pydantic python3-pydbus ubuntu-restricted-extras

    # veracrypt
    wget "https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb"
    sudo apt-get install $HOME/gnome-setup/veracrypt-1.25.9-Ubuntu-22.04-amd64.deb -y

    # input remapper
    echo -e "${BLU}Install complete. Installing input remapper.${NC}"
    wget "https://github.com/sezanzeb/input-remapper/releases/download/1.5.0/input-remapper-1.5.0_all.deb"
    sudo apt-get install /home/$USER/gnome-setup/input-remapper-1.5.0.all.deb -y
    
    # onedrive
    echo -e "${BLU}Install complete. Installing onedriver.${NC}"
    echo 'deb http://download.opensuse.org/repositories/home:/jstaf/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:jstaf.list
    curl -fsSL https://download.opensuse.org/repositories/home:jstaf/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_jstaf.gpg > /dev/null
    sudo apt update
    sudo apt install onedriver

    # extension manager flatpak
    echo -e "${BLU}Install complete. Installing extension manager.${NC}"
    flatpak install flathub com.mattjakeman.ExtensionManager -y

    echo -e "${BLU}Install complete. Moving files...${NC}"
    
    # Moving POP icon to Pictures directory for dash-to-panel
    sudo mv $HOME/gnome-setup/logo-svg/Pop-os-logo.svg /usr/share/icons/Dash-to-panel-icon.svg
    
    # hostname
    echo -e "${BLU}Files moved to correct locations. Setting hostname...${NC}"
    sudo hostnamectl set-hostname pop-5800x

    echo -e "${BLU}Install complete. Disabling unwanted gnome extensions...${NC}"

    # cosmic dock
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gnome-extensions disable cosmic-dock@system76.com

    # cosmic workspaces
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gnome-extensions disable cosmic-workspaces@system76.com

    # pop cosmic
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gnome-extensions disable pop-cosmic@system76.com

 else
    echo "${RED}
    Choose 1 or 2 retard. Re-running the script.
    ${NC}"
    
    # return to distro select
    exec bash "$0" "$@"

    fi

echo -e "${BLU}Install complete. Installing flatpaks. This may take a while...${NC}"

# vs code
flatpak install flathub com.visualstudio.code -y

# pycharm
flatpak install flathub com.jetbrains.PyCharm-Community -y

# discord
flatpak install flathub com.discordapp.Discord -y

# noisetorch
echo -e "${BLU}Install complete. Installing noisetorch.${NC}"

wget https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz

tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz

sudo -u ${RUID} gtk-update-icon-cache

sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch

# dual boot time sync
timedatectl set-local-rtc 1

# Moving FISH config file
echo -e "${BLU}Moving files.${NC}"
sudo -u ${RUID} mv $HOME/gnome-setup/configs/config.fish $HOME/.config/fish/config.fish

# change default shell to fish
sudo -u ${RUID} chsh -s /usr/bin/fish

# desktop icons
sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gnome-extensions disable ding@rastersoft.com

# just perfection
sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gnome-extension enable just-perfection-desktop@just-perfection

# load dash to panel settings
sudo -u ${RUID} dconf load /org/gnome/shell/extensions/dash-to-panel/ < /home/${RUID}/gnome-setup/configs/dash-to-panel-config

echo -e "${BLU}COMPLETE.${NC}"
