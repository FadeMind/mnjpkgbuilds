# Manjaro Linux Post Install Guide | KDE Geek Edition 2020

### REMOVE TIMESHIFT AGAINST SSD OR SETUP MANUAL SNAPSHOTS

```
sudo pacman -Rnsc timeshift && \
sudo rm -rf /timeshift /etc/timeshift.json /var/log/timeshift
```

### SET MIRRORS AND BRANCH

```
sudo pacman-mirrors --country Bulgaria Denmark Czech Germany France --api --set-branch unstable -P https && sudo pacman -Syyuu
```

```
sudo pacman -S --needed --noconfirm base base-devel yay
```

### LASTEST KERNEL [202010]

```
sudo mhwd-kernel -i linux59
```

### SWITCH NVIDIA MHWD PROFILE TO LASTEST

```
sudo  mhwd -r pci video-hybrid-intel-nvidia-450xx-prime
sudo  mhwd -i pci video-hybrid-intel-nvidia-455xx-prime
```

* Google Chrome does not recognize PRIME OFFLOAD at all. Just do not try - worthless.

* STEAM custom command for launching game is simple:

>`prime-run %command%` <br/>

**REBOOT HERE!**

### YAY

```
sudo pacman -S yay
```

**$HOME/.config/yay/config.json**
```
{
	"aururl": "https://aur.archlinux.org",
	"buildDir": "/home/fademind/.config/yay/tmp",
	"editor": "nano",
	"editorflags": "",
	"makepkgbin": "makepkg",
	"makepkgconf": "",
	"pacmanbin": "pacman",
	"pacmanconf": "/etc/pacman.conf",
	"tarbin": "bsdtar",
	"redownload": "no",
	"rebuild": "no",
	"answerclean": "",
	"answerdiff": "",
	"answeredit": "",
	"answerupgrade": "",
	"gitbin": "git",
	"gpgbin": "gpg",
	"gpgflags": "",
	"mflags": "",
	"sortby": "votes",
	"gitflags": "",
	"removemake": "ask",
	"requestsplitn": 150,
	"sortmode": 0,
	"completionrefreshtime": 7,
	"sudoloop": false,
	"timeupdate": false,
	"devel": false,
	"cleanAfter": false,
	"gitclone": true,
	"provides": true,
	"pgpfetch": false,
	"upgrademenu": true,
	"cleanmenu": true,
	"diffmenu": false,
	"editmenu": false,
	"combinedupgrade": false,
	"useask": false
}
```

### OCTOPI

```
sudo pacman -S octopi alpm-octopi-utils octopi-notifier-frameworks
```

### GTK SUDO WRAPPER

```
yay -S zensu
```

### TOOLKIT AND OTHERS

`yay -S --needed --noconfirm acpid clementine ethtool google-chrome hstr-git iw pinta krita pkgbuild-introspection qt5 smartmontools tree x86_energy_perf_policy xf86-video-fbdev mlocate  gtk3-nocsd-git p7zip-gui p7zip-zstd-codec unzip rar` </br>

`sudo pacman -Rnsc firefox konversation cantata` </br>

### ttf-ms-win10

Need `wimlib`

```
yay -G ttf-ms-win10
udisksctl loop-setup -f /run/media/$USER/STORAGE_NTFS/$USER/ISOs/WINDOWS/19041.1.191206-1406.VB_RELEASE_CLIENTPRO_OEMRET_X64FRE_PL-PL.ISO ;\
udisksctl mount -b /dev/loop0;\
wimextract /run/media/$USER/CPRA_X64FRE_PL-PL_DV5/sources/install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} --dest-dir $HOME/ttf-ms-win10/
```


### Backup to file list AUR packages

MANUAL https://www.archlinux.org/pacman/pacman.8.html

```
pacman -Qqem > pkglist-aur.txt
```
### Backup to file list main repos packages
```
pacman -Qqen > pkglist-repo.txt
```
### Restore packages from files
```
for x in $(cat pkglist-aur.txt); do yay -S --needed --noconfirm $x; done
```
```
for x in $(cat pkglist-repo.txt); do yay -S --needed --noconfirm $x; done
```
### Download only current installed packages from main repos
```
sudo pacman -Sw `pacman -Qqen`
```

OR
- https://bbs.archlinux.org/viewtopic.php?id=78313

```
pacman -Qqe | grep -vx "$(pacman -Qqm)" | xargs pacman -Sdw --noconfirm 
```

### Download only packages from `core` group repo (for ex.)
```
sudo pacman -Sw `pacman -Slq core`
```
### STEAM RUN FIX (OLD)

- https://github.com/ValveSoftware/steam-for-linux/issues/4816#issuecomment-364670373

`rm ~/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libxcb.so.1` </br>

### CONFIGURATIONS CUSTOMS
**/etc/default/grub**

`GRUB_CMDLINE_LINUX_DEFAULT="quiet apparmor=1 security=apparmor udev.log_priority=3 i915.enable_guc=2 i915.fastboot=1 pcie_aspm=off ath10k_core.skip_otp=y nowatchdog mitigations=off noibrs noibpb no_stf_barrier tsx=on"` </br>


`ipv6.disable=1` = DISABLE IPV6 STOCK IN KERNEL

```
sudo systemctl edit ntpd
```
**FIX NO IPV6**
```
[Service]
ExecStart=
ExecStart=/usr/bin/ntpd -4 -g -u ntp:ntp
```
**FIX NO IPV6 IN UFW**
```
sudo sed -i 's/IPV6=yes/IPV6=no/g' /etc/default/ufw
```

`acpi=force acpi_enforce_resources=lax` = DO NOT USE FOR NEWER HW

- https://forum.manjaro.org/t/touchpad-suddenly-not-recognised/142053 in `Mobo: HP model: 86C9 v: 56.31 serial: <filter> UEFI: AMI v: F.09 date: 12/20/2019`

- http://forums.debian.net/viewtopic.php?f=5&t=124192 (required only for lm-sensors sometimes)

### COMPILE FLAGS (legacy)
**/etc/makepkg.conf**
```
CARCH="x86_64"
CHOST="x86_64-pc-linux-gnu"
CPPFLAGS="-D_FORTIFY_SOURCE=2"
CFLAGS="-march=native -O2 -pipe -fstack-protector-strong"
CXXFLAGS="${CFLAGS}"
LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro"
MAKEFLAGS="-j$(nproc)"
DEBUG_CFLAGS="-g -fvar-tracking-assignments"
DEBUG_CXXFLAGS="-g -fvar-tracking-assignments"
BUILDENV=(!distcc color ccache check !sign)
INTEGRITY_CHECK=(sha256)
COMPRESSXZ=(xz -c -z - --threads=0)
```

### Move to TMP/SHM and disable compressions
**/etc/makepkg.conf**
```
### https://dmitryrck.com/configure-pacman-to-use-dev-shm/
#-- Specify a directory for package building.
BUILDDIR=/dev/shm/makepkg/build
#-- Destination: specify a fixed directory where all packages will be placed
PKGDEST=/dev/shm/makepkg/packages
#-- Source cache: specify a fixed directory where source files will be cached
SRCDEST=/dev/shm/makepkg/sources
#-- Source packages: specify a fixed directory where all src packages will be placed
SRCPKGDEST=/dev/shm/makepkg/srcpackages

PKGEXT='.pkg.tar'
SRCEXT='.src.tar.gz'
```

### Automount systemd any PATH

Check valid unit name
```
systemd-escape -p --suffix=mount "/run/media/fademind/ext4bkp/"
```

Create a file 
**/usr/lib/systemd/system/run-media-fademind-ext4bkp.mount**

```
[Unit]
Description=Mount Backup disk (ext4bkp)

[Mount]
What=/dev/disk/by-uuid/7f00efb5-60e4-4c52-951f-613c0780cad6 ## GET ID FROM lsblk -no UUID /dev/sdXx
Where=/run/media/fademind/ext4bkp ### do not use non letters marks!
Type=ext4
Options=defaults,noatime,discard

[Install]
WantedBy=multi-user.target
```
Run
```
sudo systemctl daemon-reload
sudo systemctl enable run-media-fademind-ext4bkp.mount
```

**/etc/tlp.conf**
```
TLP_ENABLE=1
TLP_DEFAULT_MODE=AC
TLP_PERSISTENT_DEFAULT=0
DISK_IDLE_SECS_ON_AC=0
DISK_IDLE_SECS_ON_BAT=2
MAX_LOST_WORK_SECS_ON_AC=15
MAX_LOST_WORK_SECS_ON_BAT=60
CPU_HWP_ON_AC=balance_performance
CPU_HWP_ON_BAT=balance_power
SCHED_POWERSAVE_ON_AC=0
SCHED_POWERSAVE_ON_BAT=1
NMI_WATCHDOG=0
ENERGY_PERF_POLICY_ON_AC=performance
ENERGY_PERF_POLICY_ON_BAT=power
DISK_DEVICES="sda sdb"
DISK_APM_LEVEL_ON_AC="254 254"
DISK_APM_LEVEL_ON_BAT="128 128"
SATA_LINKPWR_ON_AC="med_power_with_dipm max_performance"
SATA_LINKPWR_ON_BAT="med_power_with_dipm max_performance"
AHCI_RUNTIME_PM_TIMEOUT=15
PCIE_ASPM_ON_AC=performance
PCIE_ASPM_ON_BAT=powersave
RADEON_POWER_PROFILE_ON_AC=default
RADEON_POWER_PROFILE_ON_BAT=low
RADEON_DPM_STATE_ON_AC=performance
RADEON_DPM_STATE_ON_BAT=battery
RADEON_DPM_PERF_LEVEL_ON_AC=auto
RADEON_DPM_PERF_LEVEL_ON_BAT=auto
WIFI_PWR_ON_AC=off
WIFI_PWR_ON_BAT=on
WOL_DISABLE=Y
SOUND_POWER_SAVE_ON_AC=0
SOUND_POWER_SAVE_ON_BAT=1
SOUND_POWER_SAVE_CONTROLLER=Y
BAY_POWEROFF_ON_AC=0
BAY_POWEROFF_ON_BAT=0
BAY_DEVICE="sr0"
RUNTIME_PM_ON_AC=on
RUNTIME_PM_ON_BAT=auto
RUNTIME_PM_DRIVER_BLACKLIST="mei_me nouveau nvidia pcieport"
USB_AUTOSUSPEND=0
USB_BLACKLIST_BTUSB=0
USB_BLACKLIST_PHONE=0
USB_BLACKLIST_PRINTER=1
USB_BLACKLIST_WWAN=1
RESTORE_DEVICE_STATE_ON_STARTUP=0
```

**/etc/vconsole.conf**
```
cat <<EOT > /etc/vconsole.conf
KEYMAP=pl2
FONT=Lat2-Terminus16
FONT_MAP=8859-2
EOT
```

**/etc/modprobe.d/blacklist.conf**
```
blacklist iTCO_wdt
blacklist iTCO_vendor_support

blacklist pcspkr
```

### Fix warnings about fonts dir in Xorg log
Required `xorg-mkfontscale`

```
for d in OTF Type1 100dpi 75dpi ; do sudo mkdir -p /usr/share/fonts/$d && sudo mkfontdir /usr/share/fonts/$d ; done
```

### Fix warnings about socket issue:
```
sudo pacman -S acpid --needed --noconfirm; sudo systemctl enable acpid; sudo systemctl start acpid
```

### UFW/GUFW Setup
```
sudo bash -c "pacman -S --noconfirm --needed gufw ufw && ufw enable && ufw logging off && systemctl enable ufw && systemctl start ufw && systemctl status ufw -l && ufw status"
```
**KDE Connect ports**
```
sudo ufw allow 1714:1764/tcp
sudo ufw allow 1714:1764/udp
```

**qbittorent ports**
```
sudo ufw allow 50256/tcp
sudo ufw allow 50256/udp
```

### TLP `systemd-rfkill` service mask [reference](https://github.com/linrunner/TLP/issues/166#issuecomment-153486319)
```
sudo systemctl mask systemd-rfkill.socket systemd-rfkill.service
```

### Powertop
```
sudo -i
cd /var/cache/powertop/
ln -sf saved_results.powertop saved_parameters.powertop
exit
```

### SWAPFILE
Follow cmds
```
fallocate -l 16G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
```
Add to **/etc/fstab**
```
/swapfile none swap defaults 0 0
```


### Safety removing USB drive
`udisksctl power-off -b /dev/sdX`<br/>

### EXT4 permissions
Mount File system and made some Magic:
```
sudo chown 1000:1000 /run/media/$(whoami)/DRIVE-MOUNT-NAME
sudo chmod 755 /run/media/$(whoami)/DRIVE-MOUNT-NAME
sudo bash -c " find \"$@\" -type d -exec chmod 755 {} +"
sudo bash -c " find \"$@\" -type f -exec chmod 644 {} +"
```
where DRIVE-MOUNT-NAME is LABEL name (see **sudo blkid**)


# Install external SSL certifications

`wget foobar.com/foobar.crt && sudo cp foobar.crt /etc/ca-certificates/trust-source/anchors/ && sudo trust extract-compat`

# Restore Manjaro Default EFI Boot Entry in Laptop BIOS

1. Open BIOS/EFI setup via `[Esc]` button (boot options) and select **Enter Setup**.
2. Navigate to **Boot > Add New Boot Option**.
3. Set values and create new boot option:
- **New Boot Option** enter NAME for entry `Manjaro`.
- **Select file system** use proper PCI device path for boot drive from available
- **Path for boot** use `\EFI\Manjaro\grubx64.efi`
- SAVE changes via **Create** .
4. Save changes in BIOS Setup via `[F10]` button. Reboot.

# USEFULL CMD TOOLS

- https://forum.manjaro.org/t/43647/3

```
sudo parted -l
sudo blkid
findmnt -s
efibootmgr -v

nmcli
nmcli dev show
nmcli device wifi list

udisksctl loop-setup -f UDF-ISO-FILENAME.iso
udisksctl mount -b /dev/loop0

sudo fdisk -l
sudo e2label /dev/sdb1 "mydiskname"

inxi -Fxxxza --no-host

journalctl --this-boot --no-pager --no-hostname
systemd-analyze blame --no-pager

# https://stackoverflow.com/questions/23645595/how-to-find-linux-module-path
awk '{ print $1 }' /proc/modules | xargs modinfo -n | sort
###
rfkill list
sudo lspci -k

sudo lspci -vnnn | perl -lne 'print if /^\d+\:.+(\[\S+\:\S+\])/' | grep Control
sudo lspci -vnnn | perl -lne 'print if /^\d+\:.+(\[\S+\:\S+\])/' | grep 3D

grep -R . /sys/foo/bar

```

### Font Config 

```
sudo -i
cat <<EOT >> /etc/profile.d/freetype2.sh
export FREETYPE_PROPERTIES="truetype:interpreter-version=38"
EOT
```
```
sudo -i
cat <<EOT >> /etc/profile.d/jre.sh
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd_hrgb -Dswing.aatext=true'
EOT
```
```
sudo rm -rf /root/.cache/fontconfig/*;\
rm -rf ~/.cache/fontconfig/*;\
sudo gdk-pixbuf-query-loaders --update-cache
```

#### NANO highlight and more

```
yay -S --noconfirm nano-syntax-highlighting-git
echo "include /usr/share/nano-syntax-highlighting/*.nanorc"| sudo tee -a /etc/nanorc;\
echo "set constantshow"| sudo tee -a /etc/nanorc
```

### Disabling MAC address randomization

- https://archived.forum.manjaro.org/t/52830/8

Disabling MAC address randomization may sometimes be required to obtain a consistent connection. MAC address randomization is enabled by default in Network Manager. It may be 
disabled by adding the following lines to **/etc/NetworkManager/NetworkManager.conf**

```
[device]
wifi.scan-rand-mac-address=no
```

### HPLIP fix permissions

Update of HP Device Manager
The coming update of HP Device Manager requires manual intervention.

The filesystem permissions for the hplip folder may be different on your system.

The package default is 755. To ensure the correct permissions execute this command

`sudo chmod 755 /usr/share/hplip/* -R`

You are advised to use pacman to overwrite the offending files

`sudo pacman -Syu --overwrite /usr/share/hplip/\*`


### TIP: sort alphabetically one line

`$ echo $(printf '%s\n' zebra ant spider spider ant zebra ant | sort -u)` 


### Wine CFG sample

```
export WINEPREFIX="${HOME}/.wineapp"
export WINEARCH="win32"
winecfg
winetricks msxml6 corefonts
winetricks settings fontsmooth=rgb
```


