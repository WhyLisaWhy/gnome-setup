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
./setup.sh
```

### Import Dash-to-Panel config 
***No longer necessary, now done automatically***
```bash
Right click Panel -> Dash to Panel Settings -> About -> Import from file
Import file gnome-setup/configs/dash-to-panel-config
```

### DNF config 
***No longer necessary, now done automatically***

Edit configuration: `sudo nano /etc/dnf/dnf.conf`

- Add settings to optimize download speed:
  ```conf
  max_parallel_downloads=10
  ```
- Add some quality of life settings:
  ```conf
  defaultyes=True
  ```
 
### Gnome Extensions must have
- [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support/): Adds AppIndicator, KStatusNotifierItem and legacy Tray icons support to the Shell
- [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/): GSConnect is a complete implementation of KDE Connect especially for GNOME Shell with Nautilus, Chrome and Firefox integration. It does not rely on the KDE Connect desktop application and will not work with it installed.
- [Status Area Horizontal Spacing](https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/): Reduce the horizontal spacing between icons in the top-right status area
- [Dash to Panel](https://extensions.gnome.org//extension/1160/dash-to-panel/): An icon taskbar for the Gnome Shell. This extension moves the dash into the gnome main panel so that the application launchers and system tray are combined into a single panel, similar to that found in KDE Plasma and Windows 7+. A separate dock is no longer needed for easy access to running and favorited applications.
- [OpenWeather](https://extensions.gnome.org//extension/750/openweather/): Display weather information for any location on Earth in the GNOME Shell
