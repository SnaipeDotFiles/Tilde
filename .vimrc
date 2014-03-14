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
Bundle 'terryma/vim-multiple-cursors'

filetype plugin indent on
syntax on

" Leader key
let mapleader=','

" Colors
set t_Co=256
colorscheme jellybeans
"set background=dark

" Encoding
set encoding=utf-8

" Status messages
set laststatus=2
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)
set shortmess=roOTnxtfilm
set showcmd

" History
set undolevels=1000
set undoreload=-1
set undodir=~/.vim/undo.hist
set undofile

" Mouse
set mouse=a

" Wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

" Layout
set number
set colorcolumn=80

" Whitespace display
set list
set listchars=tab:——,trail:·,extends:→,nbsp:·,precedes:←

" Title
set title
set titlestring=Vim:\ %f\ %h%r%m

" Selection
nmap <S-Up> <ESC>v<Up>
imap <S-Up> <ESC>v<Up>
vmap <S-Up> <Up>
nmap <S-Down> <ESC>v<Down>
imap <S-Down> <ESC>v<Down>
vmap <S-Down> <Down>
nmap <S-Left> <ESC>v<Left>
imap <S-Left> <ESC>v<Left>
vmap <S-Left> <Left>
nmap <S-Right> <ESC>v<Right>
imap <S-Right> <ESC>v<Right>
vmap <S-Right> <Right>

" Search
set ignorecase
set smartcase
set showmatch
set hlsearch
set incsearch
set gdefault
set matchpairs+=<:>
nmap <leader>c <ESC>:let @/ = ""<CR>
imap <leader>c <ESC>:let @/ = ""<CR>a

" Misc
set cursorline

" Spelling
set dictionary=/usr/share/dict/words

" Completion
set omnifunc=syntaxcomplete#Complete
inoremap <leader><space> <C-X><C-O>

" Tabs
set showtabline=2
set tabpagemax=30
nmap <silent> <C-l> tabn
nmap <silent> <C-h> tabp

" Remove trailing whitespace on write
au BufWritePre <buffer> :call setline(1, map(getline(1,"$"), 'substitute(v:val, "\\s\\+$","","")'))

" Resize split when window is resized
au VimResized * :wincmd =

" .vimrc reloading
if !exists("*ReloadVimrc")
	function! ReloadVimrc()
		so $MYVIMRC
		if has('gui_running')
			so $MYGVIMRC
		endif
	endfunction
endif
map <leader>r :call ReloadVimrc()<CR>

" Auto reload .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc call ReloadVimrc()
augroup END

" Return to line when reopening a file
augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	execute 'normal! g`"zvzz' |
		\ endif
augroup END

" Yank / paste to system clipboard
set clipboard=unnamedplus
nnoremap <leader> y "+y
nnoremap <leader> x "+x
nnoremap <leader> p "+gP
nnoremap Y y$

" Write as root
cnoreabbrev w!! w !sudo tee % >/dev/null

" Retab
function! Tabbify(size)
    set noexpandtab
    set tabstop=4
    %retab!
endfunction
command! -nargs=* Tabbify execute call Tabbify( '<args>' )

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

" Plugin mappings
map <leader>gg :GitGutterToggle<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>
