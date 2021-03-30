Create new SSH keys
```
ssh-keygen -t rsa -b 4096 -C "fademind@gmail.com"
xclip -selection clipboard < ~/.ssh/id_rsa.pub
```

- https://github.com/settings/keys


**~/.bash_profile**
```
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_ASKPASS="/usr/bin/ksshaskpass"
```

**~/.extend.bashrc**
```
keychain ~/.ssh/id_rsa --quiet
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && . $HOME/.keychain/$HOSTNAME-sh-gpg
[ -f $HOME/.keychain/$HOSTNAME-sh ] && . $HOME/.keychain/$HOSTNAME-sh
```

```
ssh-keygen -t rsa -b 4096 -C "fademind@gmail.com"
```
```
xclip -sel clip < ~/.ssh/id_rsa.pub
```

**~/.ssh/config**
```
Host aur.archlinux.org
  User aur
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_rsa
  AddKeysToAgent yes 
```

**~/.gnupg/dirmngr.conf**
```
keyserver hkps://pgp.mit.edu
keyserver hkps://hkps.pool.sks-keyservers.net
keyserver hkp://keyserver.ubuntu.com:80
```

**~/.gnupg/gpg-agent.conf**
```
default-cache-ttl 300
max-cache-ttl 999999
pinentry-program /usr/bin/pinentry-kwallet
```

**~/.gnupg/gpg.conf**
```
default-key  <YOUR_SIGNING_KEY>
keyserver hkps://pgp.mit.edu
keyserver hkps://hkps.pool.sks-keyservers.net
keyserver hkp://keyserver.ubuntu.com
keyserver-options auto-key-retrieve
require-cross-certification
keyring /etc/pacman.d/gnupg/pubring.gpg
use-agent
```

yay -S  --noconfirm --needed gnupg ksshaskpass kwalletcli;\
systemctl --user enable gpg-agent.socket;\
systemctl --user start gpg-agent.socket;\
systemctl --user enable dirmngr.socket;\
systemctl --user start dirmngr.socket

**~/.gitconfig**
```
[user]
	email = <E-MAIL>
	name = <NAME>
	signingkey = <YOUR_SIGNING_KEY>
[commit]
	gpgsign = false
[gpg]
    program = gpg
[color]
    diff = auto
    status = auto
    branch = auto
    interactive = auto
    ui = true
    pager = true

```

https://stackoverflow.com/a/47087248
> `git config --global user.signingkey <YOUR_SIGNING_KEY>`<br/>
> `git config --global commit.gpgsign true`<br/>
> `git config --global gpg.program gpg`<br/>

**Reload GPG**
> `gpg-connect-agent reloadagent /bye`<br/>

**.bash_aliases**
```
alias git-commit="git pull;git add --all && git commit -S -am \"updates 20$(date +%y%m%d)\" && git push -u origin master"
```

```
-s signoff
-S gpg-sign from GH
```

See: [LINK](https://help.github.com/articles/signing-commits-using-gpg/) and [LINK](https://git-scm.com/book/be/v2/Git-Tools-Signing-Your-Work)

FIX PERMS .gnupg DIR

```
chown -R $(whoami) ~/.gnupg/
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
```

- https://superuser.com/a/954536

