# Skype for Linux setup 202005

> `yay -S --noconfirm --needed skypeforlinux-stable-bin gnome-keyring libgnome-keyring`<br/>

**/etc/pam.d/sddm**

```
#%PAM-1.0

auth		include		system-login
auth		optional	pam_kwallet5.so
auth        optional    pam_gnome_keyring.so
account		include		system-login
password	include		system-login
session		include		system-login
session		optional	pam_kwallet5.so auto_start
session     optional    pam_gnome_keyring.so auto_start
```
