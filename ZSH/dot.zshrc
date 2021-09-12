# Use powerline
USE_POWERLINE="true"

zstyle ':completion:*' rehash true

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
#  git-prompt.zsh
if [[ -e /usr/share/zsh/scripts/git-prompt.zsh ]]; then
  source /usr/share/zsh/scripts/git-prompt.zsh
fi

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr # hh to be alias for hstr
setopt histignorespace   # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor   # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j" # bind hstr to Ctrl-r (for Vi mode check doc)

# SSH
[ -f $HOME/.ssh/id_rsa ] && keychain $HOME/.ssh/id_rsa --quiet
[ -f $HOME/.keychain/$HOSTNAME-sh ] && . $HOME/.keychain/$HOSTNAME-sh
# KDE
[ -f $HOME/.config/plasma-workspace/env/envars.sh ] && . $HOME/.config/plasma-workspace/env/envars.sh

#FUNCTIONS
function pacb() {   if [[ ! -d /tmp/makepkg ]] ; then mkdir -p /tmp/makepkg ; else rm -rf /tmp/makepkg/* ; fi
if [[ -f PKGBUILD ]] ; then BUILDDIR=/tmp/makepkg makepkg -sc ; fi }
### https://stackoverflow.com/a/6364244/5351402
function pacin() { export LANG=en_US ; if ls *.pkg.tar* 1> /dev/null 2>&1; then sudo pacman -U *.pkg.tar* ; else printf "ERROR: Packages were not found!\n" ; fi }
function pacman-mirrors-set() { sudo pacman-mirrors --country Bulgaria Denmark Czech Germany France --api --set-branch unstable -P https;yay ; }
function pun() { if [ -f /var/lib/pacman/db.lck ] ; then sudo rm -rf /var/lib/pacman/db.lck ; fi; }
function kz() { sudo pkill -9 ; }

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
unset use_color safe_term match_lhs sh

# ALIASES
# alias freem="sudo bash -c 'free -h && sync && echo 3 > /proc/sys/vm/drop_caches && free -h'"
alias sudo='sudo '
alias aliases="cat $HOME/.bashrc|grep 'alias '"
alias aur-commit="git pull;mksrcinfo && git add --all && git status && git commit -am 'update' && git push -u origin master"
alias bcd="cd ~;sort -u .bash_history > bash_history && mv bash_history .bash_history;"
alias ccat='pygmentize -g'
alias clean-journal="sudo journalctl --rotate; sudo journalctl --vacuum-time=1s"
alias cp="cp -i" # confirm before overwriting something
alias df='df -hT'   # human-readable sizes
alias du='du -h' # human-readable sizes
alias eg='sudo nano /etc/default/grub'
alias free='free -mh'   # show sizes in GB
alias gc='git clone'
alias git-commit="git pull;git add --all && git status && git commit -am \"updates 20$(date +%y%m%d)\" && git push -u origin master"
alias grep='grep --color=tty -d skip'
alias lsmod="lsmod|sort"
alias orphans="pacman -Qqdt"
alias pacex="sudo pacman -D --asexplicit "
alias reboot='systemctl reboot'
alias restartps="killall plasmashell; plasmashell > /dev/null 2>&1 & disown"
alias saidar='saidar -c'
alias show-journal="journalctl --this-boot --no-pager --no-hostname"
alias src="source $HOME/.zshrc"
alias startup="systemd-analyze;systemd-analyze blame --no-pager"
alias top="top -E G"
alias ug="sudo update-grub"
alias ws='watch sensors'
alias zombie='ps axo stat,ppid,pid,comm | grep -w defunct'
alias diff='diff --color=auto'
alias la='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ls='ls -h --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

### https://unix.stackexchange.com/q/148
export GREP_OPTS='--color=auto'  # for aliases since $GREP_OPTIONS is deprecated
export GREP_COLOR='1;32' # (legacy) bright green rather than default red
export sGREP_COLORS="ms=$GREP_COLOR"  # (new) Matching text in Selected line = green
alias grep='grep $GREP_OPTS'
alias egrep='egrep $GREP_OPTS'
alias fgrep='fgrep $GREP_OPTS'
