typeset -U path
path=(~/bin $path)
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export EDITOR=vim
export PAGER=less
export READNULLCMD=$PAGER
export LESS=-FX
