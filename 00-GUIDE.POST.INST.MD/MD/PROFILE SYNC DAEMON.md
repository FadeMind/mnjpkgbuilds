### PROFILE SYNC DAEMON 

```
yay -S profile-sync-daemon --noconfirm
psd p
```
CUSTOMIZE FILE ~/.config/psd/psd.conf file.
EDIT sudoers via visudo and add 
```
fademind ALL=(ALL) NOPASSWD: /usr/bin/psd-overlay-helper
```
**BACKUP BROWSER PROFILE**
Create a new frequency time:
```
mkdir -p ~/.config/systemd/user/psd-resync.timer.d
```
File `~/.config/systemd/user/psd-resync.timer.d/frequency.conf` with code 
```
[Unit]
Description=Timer for Profile-sync-daemon

[Timer]
OnUnitActiveSec=
OnUnitActiveSec=10m
```
ENABLE AND LAUNCH PSD
```
systemctl --user enable psd
systemctl --user start psd
```

- https://wiki.archlinux.org/index.php/Profile-sync-daemon
