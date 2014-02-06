set nocompatible
filetype off

" Vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/a.vim'

filetype plugin indent on
syntax on

" encoding
set encoding=utf-8

" status messages
set laststatus=2
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)
set shortmess=roOTnxtfilm
set showcmd

" History
set undolevels=1000
set undoreload=-1
set undodir=~/.vim/undo.hist
set undofile

set cursorline
set showmatch
set matchpairs+=<:>
set hlsearch
set incsearch

set number

set list
set listchars=tab:——,trail:·,extends:#,nbsp:·
set textwidth=80
set colorcolumn=+1

set spell

" Remove trailing whitespace on write
au BufWritePre <buffer> :call setline(1, map(getline(1,"$"), 'substitute(v:val, "\\s\\+$","","")'))

" yank / paste to system clipboard
set clipboard=unnamedplus
nnoremap Y y$

" write as root
cnoreabbrev w!! w !sudo tee % >/dev/null

" Tab settings
set nowrap
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <<_

set pastetoggle=<F12>

" command completion
set wildmenu
set wildmode=list:longest:full
set wildignore+=*.o,*.aux

" Navigation
nnoremap k gk
nnoremap j gj

let mapleader=','

map <leader>gg :GitGutterToggle<CR>
