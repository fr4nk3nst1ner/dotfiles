[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

HISTSIZE=900000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups
_bash_history_sync() {
    builtin history -a
    HISTFILESIZE=$HISTSIZE
    builtin history -c
    builtin history -r
}
history() {
    _bash_history_sync
    builtin history "$@"
}
PROMPT_COMMAND=_bash_history_sync
