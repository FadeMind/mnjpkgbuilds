### DNS over TLS CLOUDFLARE SETUP

**WARNING** some sites have issues with DoT. 

- https://www.freedesktop.org/software/systemd/man/systemd-resolved.service.html

- https://www.freedesktop.org/software/systemd/man/resolved.conf.html

- https://wiki.archlinux.org/index.php/Systemd-resolved#DNS_over_TLS

- https://www.techrepublic.com/article/how-to-use-dns-over-tls-on-ubuntu-linux

- https://1.1.1.1/help

SET DNS Servers in connection:

IPV4
```
1.1.1.1
1.0.0.1
```
IPV6
```
2606:4700:4700::1111
2606:4700:4700::1001
```
Create dir for config file
```
sudo mkdir -p /etc/systemd/resolved.conf.d/
sudo nano /etc/systemd/resolved.conf.d/cloudflare.conf
```

**/etc/systemd/resolved.conf.d/cloudflare.conf**
```
[Resolve]
DNSSEC=allow-downgrade
DNSOverTLS=opportunistic
DNS=1.1.1.1#cloudflare-dns.com
DNS=1.0.0.1#cloudflare-dns.com
```
Silence
```
sudo systemctl edit systemd-resolved
```
```
[Service]
StandardOutput=null
```
Enable services
```
sudo systemctl daemon-reload
sudo systemctl enable systemd-resolved 
sudo systemctl start systemd-resolved 
sudo systemctl restart NetworkManager 
nmcli dev show
resolvectl status
```
