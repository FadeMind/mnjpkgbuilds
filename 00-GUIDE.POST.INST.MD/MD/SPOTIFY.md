**Spotify**

- https://archived.forum.manjaro.org/t/98302

```
yay -S --mflags --skipinteg --needed spotify spotify-adblock kdocker-git
```

**spotify-kdocker**
```
#!/usr/bin/env bash
if [ "$(id -u)" = "0" ]; then
    echo "This script must be run as normal user" 1>&2
    exit 1
else

APP="/opt/spotify/spotify"
 
if ps ax | grep -v grep | grep $APP > /dev/null
    then
        echo "$APP application running, everything is fine" 1>&2
    else
        env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify --high-dpi-support=1 --force-device-scale-factor=1.2 &
        kdocker -n Spotify -i $HOME/.icons/spotify-indicator.svg -q 
    fi
fi
```
