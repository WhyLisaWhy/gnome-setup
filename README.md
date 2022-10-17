## gnome-setup
Personal setup for new Nobara OS/ Pop OS Gnome Desktop Enviroment

##### Open Terminal, Download repo
```bash
git clone https://github.com/WhyLisaWhy/gnome-setup.git 
```
##### Change directory
```bash
cd gnome-setup
```
##### Run Script
```bash
sudo ./setup.sh
```

### What it does 
***User agnostic - will work for anyone using GNOME Nobara/Pop OS***

```bash
Changes max parallel from 6 to 10
Changes dnf default from no to yes

Removes packages OnlyOffice cheese rhythmbox Gnome-Videos Gnome-Photos
Installs packages libreoffice ffmpegthumbnailer gthumb timeshift yaru-theme cabextract 
  xorg-x11-font-utils pam-u2f pamu2fcfg deja-dup fish python3-evdev gtksourceview4 python3-devel 
  python3-pydantic python3-pydbus veracrypt noisetorch input-remapper pycharm onedriver vscode
  gthumb fish-sh discord
  
Installs fonts google-roboto mozilla-fira fira-code-fonts

Enables gnome-extensions gsconnect openweather just perfection
Disables gnome-extensions arcmenu pop-cosmic cosmic-dock desktop-icons

Enables Yaru-theme

Changes default shell to fish

Loads dash-to-panel config
```


 
### Gnome Extensions must have
- [Just Perfection](https://extensions.gnome.org//extension/3843/just-perfection/): Tweak Tool to Customize GNOME Shell, Change the Behavior and Disable UI Elements
- [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support/): Adds AppIndicator, KStatusNotifierItem and legacy Tray icons support to the Shell
- [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/): GSConnect is a complete implementation of KDE Connect especially for GNOME Shell with Nautilus, Chrome and Firefox integration. It does not rely on the KDE Connect desktop application and will not work with it installed.
- [Status Area Horizontal Spacing](https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/): Reduce the horizontal spacing between icons in the top-right status area
- [Dash to Panel](https://extensions.gnome.org//extension/1160/dash-to-panel/): An icon taskbar for the Gnome Shell. This extension moves the dash into the gnome main panel so that the application launchers and system tray are combined into a single panel, similar to that found in KDE Plasma and Windows 7+. A separate dock is no longer needed for easy access to running and favorited applications.
- [OpenWeather](https://extensions.gnome.org//extension/750/openweather/): Display weather information for any location on Earth in the GNOME Shell
