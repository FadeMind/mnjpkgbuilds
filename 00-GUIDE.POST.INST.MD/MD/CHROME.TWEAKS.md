### FIX CHROME DEFAULT WEB BROWSER

BE SURE THAT CHROME IS 1ST ON THE APP LIST FOR EACH ONE SUPPORTED FORMAT. 

### CHROME TWEAKS

Force H264 codec instead of VP8/VP9
- https://chrome.google.com/webstore/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk
OR
- https://chrome.google.com/webstore/detail/h264ify/aleakchihdccplidncghkekgioiakgal

Enable Hardware Accel
Install 
```
yay -S manjaro-vaapi libva-utils
```

For CHROME simply use standalone ~/.config/chrome-flags.conf additional flags sample content:
```
--flag-switches-begin
--force-dark-mode
--high-dpi-support=1
--force-device-scale-factor=1.2
--flag-switches-end
```

Additional flags to enabling in chrome://flags:
```
chrome://flags#ignore-gpu-blocklist
SET Enabled

chrome://flags#smooth-scrolling
SET Enabled

chrome://flags#enable-quic
SET Disabled

chrome://flags#enable-accelerated-video-decode
SET Enabled

chrome://flags#enable-mark-http-as
SET Enabled (mark as actively dangerous)

chrome://flags#hardware-media-key-handling
SET Disabled

chrome://flags#omnibox-context-menu-show-full-urls
SET Enabled
```

# Persepolis Download Manager 

- https://github.com/persepolisdm/persepolis

- https://chrome.google.com/webstore/detail/persepolis-download-manag/legimlagjjoghkoedakdjhocbeomojao

```
yay -S --noconfirm persepolis-git
```
