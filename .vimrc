set nocompatible
filetype off

" Vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/a.vim'
Bundle 'jistr/vim-nerdtree-tabs'

filetype plugin indent on
syntax on

" Colors
set t_Co=256

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

" Misc
set cursorline
set showmatch
set matchpairs+=<:>
set hlsearch
set incsearch

set number

set list
set listchars=tab:——,trail:·,extends:→,nbsp:·,precedes:←
set colorcolumn=80

set spell

" Tabs
set showtabline=2
set tabpagemax=30
nmap <silent> <C-l> tabn
nmap <silent> <C-h> tabp

" Remove trailing whitespace on write
au BufWritePre <buffer> :call setline(1, map(getline(1,"$"), 'substitute(v:val, "\\s\\+$","","")'))

" yank / paste to system clipboard
set clipboard=unnamedplus
nnoremap <leader> y "+y
nnoremap <leader> x "+x
nnoremap <leader> p "+gP
nnoremap Y y$

" write as root
cnoreabbrev w!! w !sudo tee % >/dev/null

function! Tabbify(size)
    set noexpandtab
    set tabstop=4
    %retab!
endfunction

" Indentation settings
set nowrap
set smartindent
set noexpandtab
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
nmap <silent> <S-h> :wincmd h<CR>
nmap <silent> <S-j> :wincmd j<CR>
nmap <silent> <S-k> :wincmd k<CR>
nmap <silent> <S-l> :wincmd l<CR>

" Leader mappings

let mapleader=','

map <leader>gg :GitGutterToggle<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>
