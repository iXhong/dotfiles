#
# ~/.bashrc
#
# Secrets and machine-specific settings belong in an untracked local file, never here.
# DEEPSEEK_API_KEY / KIMI_API_KEY are kept in ~/.zshrc.local (untracked).
[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export WORK="/home/georgeDocuments/Workspace/Lattice/"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cdw='cd $WORK'
PS1='[\u@\h \W]\$ '
