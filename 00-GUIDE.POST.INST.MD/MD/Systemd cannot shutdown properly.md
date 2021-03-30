### Systemd cannot shutdown properly

Adding to HOOKS array `shutdown` hook and refresh kernels. 

* https://www.reddit.com/r/archlinux/comments/8su99e/my_laptop_isnt_shutting_down_what_can_i_try/
* https://bbs.archlinux.org/viewtopic.php?id=233820
* https://github.com/systemd/systemd/issues/8155


The work-around for now appears to edit  `/etc/mkinitcpio.conf`  and look for the following line:

 ```
 HOOKS="base udev autodetect modconf block keyboard keymap filesystems"
 ```
 Add the  `shutdown`  hook like so:

 ```
 HOOKS="base udev autodetect modconf block keyboard keymap filesystems shutdown"
 ```
 Afterwards, regenerate the initramfs as follows:

 ```
 sudo mkinitcpio -P
 ```

 Upon reboot and a 2nd shutdown, the problem seems to go away. The developers (either archlinux or systemd) might want to check to ensure this is a regression or intended behavior.

