{
alias map=typeset -A
alias bind=typeset -T
alias var=typeset

bind LD_LIBRARY_PATH ldpath
bind EDITOR editor
bind PAGER pager
bind READNULLCMD nullpager
bind LESS less
typeset -U path ldpath

path=(~/bin $path)
ldpath=(/usr/local/lib $ldpath)
editor=vim
pager=less
nullpager=$pager
less=-FX

eval $(ssh-agent)
} >/dev/null 2>&1
