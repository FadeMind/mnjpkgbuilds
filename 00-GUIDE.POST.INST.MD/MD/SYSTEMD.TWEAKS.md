### SYSTEMD TWEAKS

### Security fixes and disable create coredumps 

- https://wiki.archlinux.org/index.php/Core_dump#Disabling_automatic_core_dumps

- https://github.com/systemd/systemd/issues/1615#issuecomment-203507283

- https://linux-audit.com/understand-and-configure-core-dumps-work-on-linux/#option-3-disable-via-systemd

```
sudo mkdir /etc/systemd/coredump.conf.d/
```
**/etc/systemd/coredump.conf.d/custom.conf**
```
[Coredump]
Storage=none
ProcessSizeMax=0
```

```
sudo rm /etc/sysctl.d/50-max_user_watches.conf
```
**/etc/sysctl.d/99-sysctl.conf**
```
fs.inotify.max_user_watches = 16384
fs.suid_dumpable = 0
kernel.dmesg_restrict = 1
kernel.kptr_restrict = 1
kernel.printk = 3 3 3 3
```
```
sudo sysctl -p /etc/sysctl.d/99-sysctl.conf
```

# Limit journald logging service and speed up boot time

- https://forum.manjaro.org/t/12342

- https://bbs.archlinux.org/viewtopic.php?pid=1504369#p1504369

**/etc/systemd/journald.conf**
```
[Journal]
SystemMaxUse=80M
SystemKeepFree=75M
MaxLevelStore=warning
MaxLevelSyslog=warning
MaxLevelKMsg=warning
MaxLevelConsole=notice
MaxLevelWall=crit
ForwardToWall=no
```

**/etc/systemd/coredump.conf**
```
[Coredump]
Storage=none
ProcessSizeMax=0
```

- https://linux-audit.com/understand-and-configure-core-dumps-work-on-linux/

- https://github.com/systemd/systemd/issues/2691#issuecomment-203534354

- https://github.com/systemd/systemd/issues/2691#issuecomment-203255422

# Cleanup journal

- https://unix.stackexchange.com/a/457902

```
sudo journalctl --rotate;sudo journalctl --vacuum-time=1s
```

# Customs some systemd services

```
sudo systemctl edit colord
```
**SILENCED**
```
[Service]
StandardOutput=null
```
