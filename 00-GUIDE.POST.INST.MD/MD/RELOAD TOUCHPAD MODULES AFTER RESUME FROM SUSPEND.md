### RELOAD TOUCHPAD MODULES AFTER RESUME FROM SUSPEND

- https://forum.manjaro.org/t/touchpad-problem-after-sleep-mode/142138/4

Create a file:
```
sudo nano /lib/systemd/system-sleep/touchpad
```
with code in:
```
#!/bin/sh

case $1 in
  post)
    /sbin/rmmod i2c_hid && /sbin/modprobe i2c_hid 
  ;;
esac
```
Make it executable
```
sudo chmod +x /lib/systemd/system-sleep/touchpad
```
Reboot, check if works for you.
