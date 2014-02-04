set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on
syntax on

set number
set colorcolumn=79
