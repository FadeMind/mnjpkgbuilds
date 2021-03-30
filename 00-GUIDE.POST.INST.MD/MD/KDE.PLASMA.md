### PLASMA 5 DESKTOP WIDGETS

`yay -S plasma5-applets-network-monitor-git plasma5-applets-thermal-monitor-git plasma5-applets-weather-widget-git plasma5-applets-eventcalendar kde-servicemenus-komparemenu` </br>

### Disable Baloo KDE Indexer
```
balooctl disable && balooctl purge
```
### Disable debug spam
```
kdebugdialog5
```

### Disale Recent files in KDE

- https://forum.manjaro.org/t/disable-recent-files-in-kde-file-dialog/36839/9**

In `~/.config/gtk-2.0/gtkfilechooser.ini` You can set the startup mode (I set it to `last`).
In `~/.config/gtk-3.0/settings.ini` Adding this line:

`gtk-recent-files-enabled=0` does the trick.

### FIX SMALL KDE TRAY

**$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc**

```
[Containments][8][General]
extraItems=org.kde.plasma.devicenotifier,org.kde.plasma.battery,org.kde.plasma.keyboardindicator,org.kde.plasma.networkmanagement,org.kde.plasma.printmanager,org.kde.kdeconnect,org.kde.plasma.bluetooth,org.kde.plasma.notifications,org.kde.plasma.volume,org.kde.plasma.mediacontroller
knownItems=org.kde.plasma.devicenotifier,org.kde.plasma.battery,org.kde.plasma.keyboardindicator,org.kde.plasma.mediacontroller,org.kde.plasma.nightcolorcontrol,org.kde.plasma.networkmanagement,org.kde.plasma.printmanager,org.kde.kdeconnect,org.kde.plasma.bluetooth,org.kde.plasma.notifications,org.kde.plasma.clipboard,org.kde.plasma.volume
scaleIconsToFit=true
showAllItems=true
```

### PAPIRUS + MATERIA KDE + KVANTUM ENGINE + HARDCODE TRAY

- https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

- https://github.com/varlesh/volantes-cursors

- https://github.com/bilelmoussaoui/Hardcode-Tray

`yay -S --needed --noconfirm papirus-icon-theme kvantum-theme-materia materia-gtk-theme kvantum-qt5 volantes-cursors-git hardcode-tray-git` </br>

USE HARDCODE TRAY FIX:
```
sudo -E hardcode-tray --conversion-tool RSVGConvert --size 22 --theme Papirus
```

### ENVIROMENTS

**FILES**
```
/etc/xdg/plasma-workspace/env/envars.sh
$HOME/.config/plasma-workspace/env/envars.sh
``` 
with
```
#!/usr/bin/bash
export BROWSER="/usr/bin/xdg-open"
export EDITOR="/usr/bin/nano"
export GCC_COLORS="auto"
export GDK_SCALE=1.2
export JAVA_FONTS="/usr/share/fonts/TTF"
export KDE_FULL_SESSION=true
export KDE_SESSION_VERSION=5
export QT_LOGGING_RULES='*=false'
export PATH="$HOME/bin:$PATH"
export SSH_ASKPASS="/usr/bin/ksshaskpass"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SYSTEMD_COLORS=1
export VISUAL=$EDITOR
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd_hrgb -Dswing.aatext=true"
export COGL_ATLAS_DEFAULT_BLIT_MODE=framebuffer
```

`.bashrc` need line
```
[ -f $HOME/.config/plasma-workspace/env/envars.sh ] && source $HOME/.config/plasma-workspace/env/envars.sh
```

### INCREASE SCROLL MOVEMENT

- http://www.webupd8.org/2015/12/how-to-change-mouse-scroll-wheel-speed.html
- https://wiki.archlinux.org/index.php/IMWheel

```
yay -S imwheel
```

**$HOME/.imwheelrc**

```
".*"
None,      Up,   Button4, 3
None,      Down, Button5, 3
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5
```

**CMD**
```
imwheel -k -b 45
```
