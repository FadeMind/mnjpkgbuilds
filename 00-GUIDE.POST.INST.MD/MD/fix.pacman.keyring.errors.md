### Fix Pacman Keyring Errors in Manjaro 

- https://wiki.manjaro.org/index.php?title=Pacman_troubleshooting

1. Remove old (and possibly broken) keys by entering this command:
```text
sudo rm -r /etc/pacman.d/gnupg 
```
2. Reinstall keyrings including the latest keys:
```text
sudo pacman -Sy gnupg archlinux-keyring manjaro-keyring
```
3. Initialize the pacman keyring:
```text
sudo pacman-key --init 
```
4. Load the signature keys:
```text
sudo pacman-key --populate archlinux manjaro 
```
5. Refresh and update the signature keys:
```text
sudo pacman-key --refresh-keys 
```
6. Clear out the software packages downloaded during the aborted installation (optional):
```text
sudo pacman -Sc
```
