![s](https://vxlabs.com/wp-content/uploads/2015/02/wpid-nvidia-linux.jpg)

- https://forum.manjaro.org/t/nvidia-435-17-driver-looks-exciting/98724
- https://forum.manjaro.org/t/nvidia-render-offloading/98737

```
sudo mhwd -r pci video-hybrid-intel-nvidia-bumblebee
sudo pacman -S lib32-nvidia-utils nvidia-utils linux52-nvidia lib32-opencl-nvidia opencl-nvidia
```
Create a new file **/etc/X11/xorg.conf.d/01-nvidia-offloading.conf**
```
Section "ServerFlags"
  Option "IgnoreABI" "1"
EndSection

Section "ServerLayout"
  Identifier "layout"
  Option "AllowNVIDIAGPUScreens"
  Screen 0 "iGPU"
EndSection

Section "Device"
  Identifier "iGPU"
  Driver "modesetting"
  BusID "PCI:0:2:0"
EndSection

Section "Screen"
  Identifier "iGPU"
  Device "iGPU"
EndSection

Section "Device"
  Identifier "nvidia"
  Driver "nvidia"
  BusID "PCI:1:0:0"
EndSection
```
Blacklist nouveau in **/etc/modprobe.d/blacklist_nouveau.conf**
```
blacklist nouveau
```
Reboot. 

* Google Chrome does not recognize PRIME OFFLOAD at all. Just do not try - worthless.

* STEAM custom command for launching game is simple:
>`prime-run %command%`
