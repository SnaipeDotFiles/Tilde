set nocompatible
filetype off

" Vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'wincent/Command-T'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/a.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'msanders/snipmate.vim'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'git://bitbucket.org/ns9tks/vim-autocomplpop.git'

filetype plugin indent on
syntax on

" Globals
if has('win32') || has('win32unix')
	let separator = '_'
else
	let separator = '.'
endif

let vimhome=$HOME . '/' . separator . 'vim'

" Leader key
let mapleader=','

" Replace useless help
map! <F1> :help<CR>

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
let undodir=vimhome . '/undo'
let &undodir=undodir
set undofile

if !isdirectory(undodir)
	call mkdir(undodir)
endif

" Mouse
set mouse=a

" Wrapping
set nowrap
"set textwidth=79
set formatoptions=qrn1

" Layout
set colorcolumn=80

" Whitespace display
set list
set listchars=tab:——,trail:·,extends:→,nbsp:·,precedes:←

" Title
set title
set titlestring=Vim:\ %f\ %h%r%m

" Selection
nmap <S-j> <ESC>vj
vmap <S-j> j
nmap <S-k> <ESC>vk
vmap <S-k> k
nmap <S-h> <ESC>vh
vmap <S-h> h
nmap <S-l> <ESC>vl
vmap <S-l> l

" Pair matching
set showmatch
set matchtime=3

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault
set matchpairs+=<:>
map! <leader>c <ESC>:let @/ = ""<CR>

" Misc
set backspace=indent,eol,start
set ttyfast
set cursorline

" Spelling
set dictionary=/usr/share/dict/words

" Completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <leader>j <C-X><C-O>
inoremap <C-Space> <C-X><C-O>
inoremap <C-@> <C-X><C-O>

" Tabs
set showtabline=2
set tabpagemax=30
nmap <silent> <C-l> tabn
nmap <silent> <C-h> tabp

" Autoreload file
set autoread
au CursorHold * checktime

" Toggle between relative and absolute numbering
set nonumber
set relativenumber

function! NumberToRelative()
	set nonumber
	set relativenumber
endfunc
function! RelativeToNumber()
	set number
	set norelativenumber
endfunc

function! ToggleNumbering()
	if (&relativenumber == 1)
		call RelativeToNumber()
	else
		call NumberToRelative()
	endif
endfunc

cnoreabbrev togglenumbering :call ToggleNumbering()
cnoreabbrev tnu :call ToggleNumbering()
nnoremap <F2> :call ToggleNumbering()<CR>
autocmd InsertEnter * :call RelativeToNumber()
autocmd InsertLeave * :call NumberToRelative()

" No arrow keys, thanks
nnoremap <up>	 <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>	 <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

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
cnoreabbrev reloadvim :call ReloadVimrc()
map <leader>r :call ReloadVimrc()<CR>

" Auto reload .vimrc
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc call ReloadVimrc()
augroup END

" Disable backup when there is version control
if isdirectory(".git") || isdirectory(".svn") || isdirectory(".hg")
	set nobackup
endif

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

set pastetoggle=<F12>

" Write as root
cnoreabbrev w!! w !sudo tee % >/dev/null

" Retab
function! Tabbify(size)
	set noexpandtab
	let &l:tabstop = a:size
	%retab!
endfunction
command! -nargs=1 Tabbify call Tabbify( '<args>' )
cnoreabbrev rei Tabbify

" Indentation settings
set smartindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >><ESC>_
vnoremap <S-Tab> <<<ESC>_
inoremap <S-Tab> <<_

" command completion
set wildmenu
set wildmode=list:longest:full
set wildignore+=*.o,*.aux

" Navigation
nnoremap k gk
nnoremap j gj
nmap <silent> <left> :wincmd h<CR>
nmap <silent> <down> :wincmd j<CR>
nmap <silent> <up> :wincmd k<CR>
nmap <silent> <right> :wincmd l<CR>

" Plugin mappings
map <leader>gg :GitGutterToggle<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>
