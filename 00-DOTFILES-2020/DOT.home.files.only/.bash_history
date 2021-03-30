yay -G ttf-fonts-win10
yay -G ttf-win10-fonts
sudo pacman-mirrors --country Bulgaria Denmark Czech Germany France --api --set-branch unstable -P https && sudo pacman -Syyuu
mkdir -p $HOME/.config/yay
kate $HOME/.config/yay/config.json
sudo pacman -S yay
sudo nano /etc/makepkg.conf 
yay -S google-chrome-stable
yay -S google-chrome
yay papirus
yay adapta
yay gtk-engine
yay win10
yay -S wimlib
yay -G ttf-ms-win10
cd ttf-ms-win10/
udisksctl loop-setup -f /run/media/fademind/STORAGE_NTFS/fademind/STORAGE/ISOs/WINDOWS/19041.172.200225-1822.VB_RELEASE_SVC_PROD3_CLIENTPRO_OEMRET_X64FRE_PL-PL.ISO ;udisksctl mount -b /dev/loop0
wimextract /run/media/fademind/CPRA_X64FRE_PL-PL_DV5/sources/install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} --dest-dir /home/fademind/ttf-ms-win10
ls
updpkgsums 
makepkg -srci
systemctl reboot
yay materia
yay materia-kde
yay materia-gtk
yay capitaine-cursors
ln -sf .gtkrc-2.0 .gtkrc-2.0-kde4
yay -Rnsc firefox
rm -rf .mozilla/
yay bitwarden
sensors
yay -S manjaro-material-blue-wallpaper-git
yay -S manjaro-mono-splash-plasma5-git
pacman -Ql manjaro-material-blue-wallpaper-git
sudo nano /etc/sddm.conf.d/hidpi.conf
makepkg -s --skippgpcheck 
yay -U spotify*tar
yay -S spotify
yay -S spotify-adblock
makepkg -srci
rm -rf ~/.local/share/RecentDocuments && install -dm0 ~/.local/share/RecentDocuments
for d in OTF Type1 100dpi 75dpi ; do sudo mkdir -p /usr/share/fonts/$d && sudo mkfontdir /usr/share/fonts/$d ; done
sudo pacman -S acpid --needed --noconfirm; sudo systemctl enable acpid; sudo systemctl start acpid
sudo bash -c "pacman -S --noconfirm --needed gufw ufw && ufw enable && ufw logging off && systemctl enable ufw && systemctl start ufw && systemctl status ufw -l && ufw status"
yay -Su
sudo systemctl mask systemd-rfkill.socket systemd-rfkill.service
sudo sysctl -p /etc/sysctl.d/99-sysctl.conf
sudo nano /etc/sysctl.d/99-sysctl.conf
sudo sysctl -p /etc/sysctl.d/99-sysctl.conf
ls /etc/sysctl.d/
sudo rm /etc/sysctl.d/50-max_user_watches.conf 
cat /etc/groups
cat /etc/group
sudo dmesg |grep nvidia
glxinfo
glxinfo |grep Open
sudo pacman -Syu
sudo -i
sudo nano /etc/polkit-1/rules.d/49-nopasswd_global.rules
sudo nano $HOME/.config/kdesurc
sudo nano /etc/environment 
yay -S --nconfirm nano-syntax-highlighting-git
yay -S --noconfirm nano-syntax-highlighting-git
echo "include /usr/share/nano-syntax-highlighting/*.nanorc"| tee -a /etc/nanorc
sudo -i
balooctl disable && balooctl purge
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep "OpenGL renderer"
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo
clear
glxinfo | grep -i vendor
mhwd -li
DRI_PRIME=1 glxinfo | grep "OpenGL renderer"
pacman -Q|grep nvidia
cat /etc/X11/xorg.conf
prime-run glxinfo | grep "OpenGL renderer"
kate /var/log/Xorg.0.log
inxi -G
 __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo
xrandr --listproviders
inxi -G
mhwd -li
prime-run glxinfo | grep "OpenGL renderer"
sudo dmesg > dmesg.log
kate /var/log/Xorg.0.log
pacman -Q|grep nvidia
sudo mkinitcpio -P
sudo update-grub 
systemctl reboot
prime-run glxinfo | grep "OpenGL renderer"
prime-run glxinfo | grep "Open"
sudo kate /etc/systemd/journald.conf
nano /etc/polkit-1/rules.d/49-nopasswd_global.rules
sudo nano /etc/polkit-1/rules.d/49-nopasswd_global.rules
yay -S profile-sync-daemon --noconfirm
sudo nano /etc/vconsole.conf
cat /etc/fstab.conf
cat /etc/fstab 
pacman -Qo /etc/fstab
pacman -Ql filesystem
sudo nano /etc/default/grub 
ls /etc/modprobe.d/
cat /etc/modprobe.d/*
sudo nano /etc/modprobe.d/blacklist.conf
sudo nano /etc/default/tlp
pacman -Q|grep tlp
pacman -Ql|grep tlp
yay -S x86_energy_perf_policy
sudo tlp-stat
sudo tlp-stat
sudo update-grub 
systemctl reboot
sudo tlp-stat
sudo dmesg
sudo dmesg|grep pci
sudo dmesg|grep pcie
sudo dmesg|grep pcip
sudo dmesg|grep pci-po
yay -S smartmontools
kate /etc/tlp.conf 
systemctl restart tlp
sudo tlp-stat
sudo dmesg|grep watch
sudo dmesg|grep TC
systemd-analyze 
sudo dmesg|grep Realte
sudo dmesg|grep LAN
sudo dmesg|grep r8
sudo dmesg|grep realt
inxi -N
sudo nano /etc/modprobe.d/blacklist.conf 
inxi -N
sudo dmesg|grep realt
sudo dmesg|grep r8169
yay -S persepolis
yay -S clementine
pacman -Ql persepolis
ldd /usr/bin/persepolis
yay p7zip
yay -Rnsc cantata
yay -Rnsc konverseen
yay -Rnsc konversation
yay -Rnsc yakuake
sudo -i
inxi -Fxxxza --no-host
clear
wdctl
cat /proc/sys/kernel/watchdog
kate .bashrc 
yay kompare
sudo pacman -S gnupg pinentry --needed --noconfirm
systemctl --user enable gpg-agent.socket
systemctl --user start gpg-agent.socket
systemctl --user enable dirmngr.socket
systemctl --user start dirmngr.socket
nano $HOME/.gnupg/dirmngr.conf
nano $HOME/.gnupg/gpg.conf
nano $HOME/.gnupg/gpg-agent.conf
yay -S kwalletcli
gpg-connect-agent reloadagent /bye
nano $HOME/.gnupg/gpg-agent.conf
nano $HOME/.gnupg/gpg.conf
nano $HOME/.gnupg/dirmngr.conf
yay -S gnupg ksshaskpass
yay -S xclip
ssh-keygen -t rsa -b 4096 -C "fademind@gmail.com"
xclip -sel clip < ~/.ssh/id_rsa.pub
xclip -sel clip < ~/.ssh/id_rsa.pub
xclip -sel clip < ~/.ssh/id_rsa.pub
xclip -sel clip < ~/.ssh/id_rsa.pub
src
source .bashrc 
yay -S keychain
yay -S hstr-git
yay -S bash-completion
source .bashrc 
sudo pacman -Syu
sudo nano /etc/pacman.conf 
cd AUR/
ls
yay -S kdocker-git
yay
kate .bashrc 
wget https://raw.githubusercontent.com/FadeMind/mnjpkgbuilds/master/00-DOTFILES/.bashrc?token=ACLEBJGABIKJODITNXARXQC6RV2IG -O bashrc
wget https://raw.githubusercontent.com/FadeMind/mnjpkgbuilds/master/00-DOTFILES/.bashrc -O bashrc
src
yay pygmentize
ccat .bashrc 
clear
uname -a
cd GitHub/
gc git@github.com:FadeMind/mnjpkgbuilds.git
yay -S copyq
git fetch
git status
git pull
yay -G kdocker-git
yay -S plasma5-applets-network-monitor plasma5-applets-thermal-monitor plasma5-applets-weather-widget
cd
yay -G libreoffice-fresh-rpm
cd libreoffice-fresh-rpm/
kate PKGBUILD 
wget "https://download.documentfoundation.org/libreoffice/stable/" -q -O /tmp/lo.html && echo "LibreOffice versions" && awk '{print $3;}' /tmp/lo.html|cut -b 7-11|grep --color=never [0-9].[0-9].[0-9]; rm /tmp/lo.html
makepkg -src
ls
yay -U *pkg.tar
cd
yay -G masterpdfeditor-qt5
yay -G masterpdfeditor
cd masterpdfeditor/
makepkg -srci
yay -U *pkg.tar
masterpdfeditor5 
yay -R masterpdfeditor 
ls
rm master*pkg*
ls
patch -Np1 < patch.diff 
makepkg -srci
updpkgsums 
nano masterpdfeditor.sh.patch 
makepkg -srci
masterpdfeditor5 
yay -S bleachbit
yay -G netflix-qdesktop 
cd netflix-qdesktop/
makepkg -sci
yay qtws-base
makepkg -sci
yay -S chromium-widevine
cd netflix-qdesktop/
kate PKGBUILD 
rm *pkg*
ls
updpkgsums 
makepkg -sci
pacman -Qi netflix-qdesktop 
locate /usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so
yay -S mlocate
sudo updatedb
locate /usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so
locate libwidevinecdmadapter.so
ip addr
yay -S miniupnpd
sudo systemctl enable miniupnpd 
sudo systemctl start miniupnpd 
sudo systemctl status miniupnpd 
kate /etc/miniupnpd/miniupnpd.conf &
sudo systemctl disable  miniupnpd 
sudo systemctl stop  miniupnpd 
yay -R miniupnpd
sudo ufw status
sudo ufw reload
sudo ufw status
sudo ufw status numbered
sudo nano /etc/default/ufw
sudo ufw reload
sudo ufw status
sudo ufw allow 48654:48654
sudo ufw allow 48654
sudo ufw status
find "$@" -type f -exec chmod 644 {} +
find "$@" -type d -exec chmod 755 {} +
la
cd Data/
ls
cd 00/
la
yay -G spotify
rm -rf spotify-adblock-git/ kdocker-git/
yay -G spotify-adblock-git kdocker-git
psd p
sudo visudo 
clear
mkdir -p ~/.config/systemd/user/psd-resync.timer.d
nano ~/.config/systemd/user/psd-resync.timer.d/frequency.conf
psd p
psd-start
psd p
df
nano ~/.config/systemd/user/psd-resync.timer.d/frequency.conf
sudo sensors-detect 
sensors
yay -S synaptic
yay  synaptic
pacman -Ql xf86-input-synaptics 
yay pkgbuild-introspection
locate mksrcinfo
yay -S pkgbuild-introspection
yay konvers
cat /etc/tlp.conf 
yay megasync
yay -G megasync
cd megasync/
makepkg -sc
sudo systemctl edit ntpd
sudo systemctl daemon-reload
systemctl status ntpd
cat /usr/bin/prime-run 
kate /etc/default/grub 
yay -S megasync 
yay
tar cf - chrome-20$(date +%y%m%d)-MNJ/ | xz -T 0 -7 -zf - > chrome-20$(date +%y%m%d)-MNJ.tar.xz
mkdir chrome-20$(date +%y%m%d)-MNJ
tar cf - chrome-20$(date +%y%m%d)-MNJ/ | xz -T 0 -7 -zf - > chrome-20$(date +%y%m%d)-MNJ.tar.xz
cat /etc/environment 
kate /etc/udev/rules.d/60-ioschedulers.rules
htop
lspci 
lsusb
export GDK_DPI_SCALE=1,25
thunderbird 
export GDK_DPI_SCALE=1.25
thunderbird 
export GDK_DPI_SCALE=1.1
thunderbird 
GDK_SCALE=2 GDK_DPI_SCALE=-1 thunderbird 
GDK_SCALE=1.2 GDK_DPI_SCALE=-1 thunderbird 
GDK_SCALE=1 GDK_DPI_SCALE=-1 thunderbird 
GDK_SCALE=1 GDK_DPI_SCALE=1.25 thunderbird 
GDK_SCALE=1 GDK_DPI_SCALE=1.1 thunderbird 
GDK_SCALE=1 GDK_DPI_SCALE=1.1 thunderbird 
GDK_DPI_SCALE=1.2 thunderbird 
GDK_DPI_SCALE=1.2 thunderbird 
GDK_DPI_SCALE=0.66 thunderbird 
psd p
cat bin/psd-start 
systemctl --user enable psd
systemctl --user start psd
systemctl --user status psd
yay -R capitaine-cursors 
psd p
ls .config/
xdg-open mailto:fademind@m.pl
xdg-open mail-to:fademind@m.pl
xdg-open fademind@m.pl
uname -a
uname -a
cat .xinitrc 
systemd-analyze critical-chain
systemd-analyze 
uname -a
inxi -Fxz
yay -S pinta
inxi -G
grep modesetting /var/log/Xorg.0.log
kate .bashrc 
sudo nano /etc/X11/xorg.conf.d/20-intel.conf
yay optimus-manager
kate /etc/X11/xorg.conf.d/20-intel.conf
mhwd-gpu --check
sudo mhwd-gpu --check
sudo mhwd-gpu 
xrandr --listproviders
mhwd -li
ls /etc/X11/xorg.conf.d/
ls /etc/X11/mhwd.d/
yay
systemctl reboot 
cat .xinitrc 
systemd-analyze 
cat /etc/default/grub 
systemctl status ufw
psd p
systemctl --user stop psd
systemctl --user start psd
systemd-analyze 
psd p
inxi -G
kate /etc/X11/mhwd.d/nvidia.conf 
kate /etc/X11/mhwd.d/nvidia.conf 
systemctl poweroff 
ls /tmp/
df /var/cache/pacman/
du /var/cache/pacman/
du -H /var/cache/pacman/
man du
du -h /var/cache/pacman/
tree
yay -S tree
man yay
psd p
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/thunderbird-theme-papirus/master/install.sh | sh
QT_STYLE_OVERRIDE="kvantum" persepolis 
yay -S hardcode-tray
sudo -E hardcode-tray --conversion-tool RSVGConvert --size 22 --theme Papirus
megasync 
sensors
yay 
saidar
yay -S libstatgrab
sudo dmesg|grep firmware|grep ath10k_pci
sudo chmod 755 /usr/share/hplip/* -R
sudo pacman -Syu --overwrite /usr/share/hplip/\*
journalctl -xe
kate /etc/hosts 
sudo mv /etc/hosts /etc/hosts.bak
sudo cp hosts /etc/
cat /etc/hosts
sudo find /sys -name '*mitigation*'
spectre-meltdown-checker 
sudo spectre-meltdown-checker 
kate /etc/default/gr
kate /etc/default/grub 
ug
ug
systemctl poweroff 
sudo spectre-meltdown-checker 
systemd-analyze 
systemd-analyze blame
sudo dmesg 
sudo dmesg > dmesg.log; kate dmesg.log &
cat /etc/hosts
grep . /sys/devices/system/cpu/vulnerabilities/*  
kate /etc/default/grub 
yay
kate /etc/default/grub 
cat /usr/bin/prime-run 
glxinfo|grep Open
prime-run glxinfo |grep Open
yay wine
sudo pamac install xdg-desktop-portal-gtk
kate /etc/default/grub 
yay
sensors
prime-run nvidia-smi
cd GitHub/
gc git@github.com:FadeMind/hosts.extras.git
cd hosts.extras/
git status
git diff add.Risk/hosts
git diff rlwpx.free.fr.hrsk/hosts
git add --all && git status && git commit -am "hidemyass.com GH-31" && git push -u origin master
yay -G rar
cd rar
nano PKGBUILD 
pacb
ls
pacin 
rar /?
yay -G profile-sync-daemon
yay etcher
yay -S plasma5-applets-eventcalendar
yay thermal
yay thermal-monit
yay -R  plasma5-applets-thermal-monitor
yay -R  plasma5-applets-thermal-monitor-git 
yay profile-cleaner
yay kde-servicemenus-thunderbird-attachment
gc ssh://aur@aur.archlinux.org/aic94xx-firmware.git
cd aic94xx-firmware/
yay converseen
pkill yay
yay -S peazip-qt
htop
pacman -Qtdq
pacex extra-cmake-modules
pacex meson
pacex patchelf
pacex doxygen
pacman -Qtdq
sudo pacman -Rns $(pacman -Qtdq)
sudo -i
locate bleachbit
locate bleachbit-root
sh /home/fademind/GitHub/mnjpkgbuilds/00-BIN/bleachbit-root
sudo bleachbit 
sudo pacman -S kube
yay -Rnsc kube 
yay trojita
yay -Rnsc trojita 
la
rm .hosts
rm hosts
ls .config/
rm -rf .config/kube/
tree
tree .config/flaska.net/
kate .config/flaska.net/trojita.conf 
rm .config/flaska.net/ -rf
locate network-suspend.service
mkdir ath10k-systemd-network-suspend-service
cd ath10k-systemd-network-suspend-service/
updpkgsums 
pacb
updpkgsums 
pacb
pacin 
sudo systemctl enable network-resume.service
sudo systemctl enable network-suspend.service 
sudo systemctl status network-resume.service
sudo systemctl disable network-resume
sudo systemctl disable network-suspend
yay -R ath10k-systemd-network-suspend-service 
kate PKGBUILD
cd
updpkgsums
saidar
sudo mv klipper.desktop{,.bak}
cat klipper.desktop.bak 
pkill klipper
pacman -Ql qt5-base |grep /bin
pacman -Ql plasma-desktop |grep /bin
lookandfeeltool 
top
yay
yay
systemctl reboot
sudo dmesg|grep Erro
sudo dmesg|grep Warn
sudo dmesg|grep Fail
sudo dmesg|grep fail
sudo dmesg|grep drm
inxi -G
cat /var/log/Xorg.0.log|grep intel
cat /var/log/Xorg.0.log|grep modesetti
cat /var/log/Xorg.0.log|grep kdms
cat /var/log/Xorg.0.log|grep kms
cat /var/log/Xorg.0.log|grep drm
pacman -Qii megasync 
yay -S qt5-styleplugins
export QT_QPA_PLATFORMTHEME=kvantum
megasync 
yay -S qt5ct
megasync --platformtheme qt5ct
sudo nano /etc/environment 
sudo nano /etc/environment 
yay -R qt5ct 
rm -rf .config/qt5ct/
cat /etc/environment 
sudo ln -sf /home/fademind/.config/Trolltech.conf /etc/xdg/Trolltech.conf 
qtconfig-qt4
yay pyqt5
echo $QT_QPA_PLATFORMTHEME
echo QT_QPA_PLATFORMTHEME
yay -G gtk3-nocsd-git
cd gtk3-nocsd-git/
nano PKGBUILD 
pacb
pacin 
pacman -Ql gtk3-nocsd-git
la
sudo nano /etc/environment 
sudo nano /etc/environment 
cat /etc/environment 
locate zensu
sudo bleachbit 
yay zensu
pacman -Ql zensu
zensu bleachbit
gksu bleachbit 
zensu bleachbit
man zensu
zensu /?
kate admin:/etc/fstab 
yay zensu
pacman -Qii zensu
yay -S yad
yay -S yad
zensu bleachbit
yay -R yad
zensu bleachbit
sensors
pacman -Qii netflix-qdesktop 
cat /etc/tlp.conf
kate /etc/tlp.conf 
kate /etc/udev/rules.d/60-scheduler.rules
cat /etc/default/grub 
cat /etc/modprobe.d/blacklist.conf 
modinfo i915
upy
yay
inxi -N
inxi -Fxz
cat .gnupg/dirmngr.conf
cat ~/.gitconfig
cat /etc/default/grub |grep LINUX_DEF
pacman -Q|grep theme
pacman -Q|grep materia
pacman -Q|grep kvantu
pacman -Q|grep calen
pacman -Q|grep thund
cat /etc/environment 
psd p
nano ~/.config/systemd/user/psd-resync.timer.d/frequency.conf
bash CLEANUP 
git-commit 
la
rm .git/
rm .git/ -rf
rm .git/ -rf
git add 00-AUR-PKG/netflix-qdesktop
git add 00-AUR-PKG/megasync
git status
git rm -r 00-AUR-PKG/megasync/.git
git rm -r --cached  00-AUR-PKG/megasync/.git
git-commit 
git rm --cached 
git rm --cached 00-AUR-PKG/megasync
git rm --cached 00-AUR-PKG/netflix-qdesktop
git status
git-commit 
upy
yay
git status
upy
yay
sensors
nvidia-smi 
rfkill list
sensors
lsb_release 
sensors
lsb_release -a
pkill kdocker 
yay
locate config
cat /proc/config.gz
1;2c1;2c1;2c1;2c
gcat /proc/config.gz
zcat /proc/config.gz
zcat /proc/config.gz|grep BLK
zcat /proc/config.gz|grep CONFIG_SCSI_MQ_DEFAULT
zcat /proc/config.gz|grep CONFIG_SCSI_MQ_
zcat /proc/config.gz|grep SCSI_MQ_
zcat /proc/config.gz|grep SCSI_MQ
zcat /proc/config.gz|grep SCSI_
sudo tree /sys/module/scsi_mod/parameters
ug
systemctl reboot
cat /sys/class/block/sd*/queue/scheduler 
cat /sys/module/dm_mod/parameters/use_blk_mq
cat /sys/module/dm_mod/parameters/*
cat /sys/class/block/sd*/queue/scheduler 
cat /sys/class/block/sd*/queue/scheduler |head
eg
ug
reboot 
psd p
systemctl --user stop psd
systemctl --user disable psd
rm .config/google-chrome
rm .config/google-chrome -rf
mv .config/google-chrome-backup-crashrecovery-20200410_065525/ .config/google-chrome
cat /sys/class/block/sd*/queue/scheduler |head
cat /sys/module/dm_mod/parameters/*
cat /sys/module/dm_mod/parameters/use_blk_mq
psd p
yay -R profile-cleaner profile-sync-daemon 
rm -rf ~/.config/systemd/user/psd-resync.timer.d
rm -rf ~/.config/psd
psd p
kate /etc/udev/rules.d/60-scheduler.rules
kate /etc/udev/rules.d/60-ioschedulers.rules
eg
ug
systemctl reboot
killall spotify 
cat /sys/class/block/sd*/queue/scheduler 
cat /sys/block/dm-*/dm/use_blk_mq
cat /sys/block/*/dm/use_blk_mq
tree /sys/class/block/sda/
grep -n "cpu" /sys/class/block/sd*/mq/*/*
grep -n "cpu" /sys/class/block/sd*
cat /sys/class/block/sd*|grep cpu
grep -n "cpu" /sys/class/block/sda/mq/0/cpu0/
cat /sys/block/*/use_blk_mq
cat /sys/block/sda/mq/*
cat /sys/block/sda/mq/0/cpu0
cat /sys/block/sda/mq/0/cpu0/*
kate /etc/udev/rules.d/60-ioschedulers.rules
eg
eg
ug
sudo tlp-stat -d|grep Sch
sudo tree /sys/block/sda/mq
pacman -Q |grep tlp
uname -a
sudo tlp-stat
tree /sys/class/block/sda/
cat /sys/module/dm_mod/parameters/use_blk_mq
tree /sys/block/sda/mq
cat /etc/default/grub |grep LINUX_DEF
tree /sys/block/sda/mq/
sudo tlp-stat
ug
cat /sys/class/block/sd*/queue/scheduler 
cat /sys/class/block/*/queue/scheduler 
tree -d /sys/class/block/
systemd-analyze 
cat /sys/module/dm_mod/parameters/use_blk_mq
tree /sys/block/sda/mq
eg
tree -d /sys/class/block/
cat /sys/module/dm_mod/parameters/use_blk_mq
eg
kate /etc/default/grub 
ug
cat /sys/module/dm_mod/parameters/use_blk_mq
modinfo dm_mod
kate /etc/default/grub 
modinfo scsi_mod
modinfo scsi_mod
cat /sys/module/scsi_mod/parameters/
cat /sys/module/scsi_mod/parameters/*
tree /sys/module/scsi_mod/parameters/
cat /sys/module/scsi_mod/parameters/use_blk_mq 
tree /sys/block/sd*/mq
cat /sys/module/scsi_mod/parameters/use_blk_mq
uname -a
cat /var/log/Xorg.0.log|grep EE
cat /etc/modprobe.d/*
ls/ etc/modprobe.d/*
ls /etc/modprobe.d/*
cat /etc/modprobe.d/mhwd-gpu.conf 
modinfo fbdev
inxi -Fxxxz0
inxi -Fxxxz
yay
eg
kate /etc/default/grub 
ug
reboot
sudo spectre-meltdown-checker 
kate /etc/default/grub 
ug
reboot
sudo spectre-meltdown-checker 
kate /etc/default/grub 
ug
sudo spectre-meltdown-checker 
ls -1A /sys/devices/system/cpu/vulnerabilities
cat /sys/devices/system/cpu/vulnerabilities/l1tf
cat /sys/devices/system/cpu/vulnerabilities/
yay 
ls /etc/xdg/autostart/
cat /etc/xdg/autostart/msm_kde_notifier.desktop
pacman -Q|grep breath
yay -Rnsc ${pacman -Q|grep breath}
yay -Rnsc $(pacman -Q|grep breath)
yay -Rnsc $(pacman -Qm|grep breath)
pacman -Qm|grep breath
yay -Rnsc plasma5-themes-breath2 
pacman -Ql manjaro-base-skel 
cat /etc/skel/.Xclients 
pacman -Ql manjaro-kde-settings
pacman -Ql manjaro-kde-settings-19.0 
kate /usr/share/mime/packages/kde-mimetypefixes.xml
cat /etc/profile.d/qt5-accessibility.sh
cat /etc/sddm.conf.d/virtualkeyboard.conf
locate maya
pacman -Qo /usr/share/sddm/themes/maya
yay onlyoffice
pacman -Qii plasma-desktop 
pacman -Q|grep plasma
pacman -Q|grep qt
export LANG=en_US
systemsettings5 
yay keyboardindi
yay keyboard-indica
yay -S teamviewer
sudo systemctl enable teamviewerd
sudo systemctl start teamviewerd
sudo systemctl status teamviewerd
teamviewer 
yay haveged
cat /proc/sys/kernel/random/entropy_avail
yay -S haveged
sudo systemctl enable haveged
sudo systemctl start haveged
cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_avail
cat /proc/sys/kernel/random/entropy_avail
sudo systemctl stop haveged
sudo systemctl disable haveged
yay -R haveged
cat /proc/sys/kernel/random/entropy_avail
yay skype
upy
yay
yay
yay -G dolphin-megasync-git
cd dolphin-megasync-git/
pacb
pacin 
yay -G megasync
pacb
kate $HOME/.config/yay/config.json
etc-bkp 
cp -r .config/*rc /home/fademind/rcb/
