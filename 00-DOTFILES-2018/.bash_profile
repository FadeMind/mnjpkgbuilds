#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_ASKPASS="/usr/bin/ksshaskpass"

### https://forum.manjaro.org/t/21790/9

QT_LOGGING_RULES="*=false"
export QT_LOGGING_RULES
