set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
" Per project .lvimrc
Plug 'embear/vim-localvimrc'
Plug 'msanders/snipmate.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/ag.vim'
Plug 'vim-scripts/lh-vim-lib'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'michalbachowski/vim-wombat256mod'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Valloric/ListToggle'
Plug 'Chiel92/vim-autoformat'
call plug#end()

syntax on
"filetype on
filetype plugin on
filetype indent on

" Doxygen syntax
let g:load_doxygen_syntax=1

set history=1000
set showmatch
set matchtime=0
set shortmess=atI
set ruler
set number
set showcmd

" Allow switching edited buffers without saving
set hidden

" Status line
set laststatus=2
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

set sidescroll=1
set sidescrolloff=3

" Set xterm title
set title

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase

set ttyfast
set visualbell
set noerrorbells
set mouse=a
set printoptions=paper:A4

" Keep more lines of context
set scrolloff=3

" Make backspace delete lots of things
set backspace=indent,eol,start

" Auto-backup files and .swp files don't go to pwd
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Persistent undo
set undodir=~/.vim-undo/
set undofile

" Look for the file in the current directory, then south until you reach home.
set tags=tags;~/

" Change <Leader>
let mapleader = ","
nore ; :
nore , ;

" Quick timeouts on key combinations.
set timeoutlen=300

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Tab management
" Previous tab
nmap H gT
" Next tab
nmap L gt

" Toggle highlighting
nmap <silent> <leader>d :silent :nohlsearch<CR>

" End and beginning of line
nmap <C-h> ^
nmap <C-l> $
vmap <C-h> ^
vmap <C-l> $

" Scroll faster
nore <C-e> 3<C-e>
nore <C-y> 3<C-y>

" Copy and paste from X clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Bash-like filename completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.so,*.d,*.a,*~,*.pyo,*.pyc

" Line too long guide
set colorcolumn=+1
set textwidth=80

" Gvim
if has('gui_running')
	set t_Co=256
	set encoding=utf-8
	set cursorline
	set guioptions-=m  " no menubar
	set guioptions-=T  " no toolbar
	set gfn=Terminus\ 10
endif

colorscheme wombat256mod

" Highlight whitespace
highlight ExtraTabs ctermbg=red guibg=red
highlight ExtraWhiteSpace ctermbg=red guibg=red
autocmd BufWinEnter * syntax match ExtraTabs /^\t\+/
autocmd BufWinEnter * syntax match ExtraWhiteSpace /^ \+\t\+\|\s\+$/

" Remove useles whitespace
nmap <c-F3> :call RmUselessSpaces()<CR>

function! RmUselessSpaces()
	" Trailing whitespace
	:%s/\s\+$//e
	" Leading whitespace
	:%s/ \+\t/\t/ge
endfunction

" Justify text paragraphs
let @j='vipgq<CR>'
nore <Leader>j @j

" Global tab/space configuration
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" a.vim
nmap <silent> <Leader>a :A<CR>

set path+=.,**,./**,/usr/local/include,/usr/include
set complete-=i

" localvimrc
let g:localvimrc_persistent=1

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au BufEnter * RainbowParenthesesLoadRound
au BufEnter * RainbowParenthesesLoadSquare
au BufEnter * RainbowParenthesesLoadBraces

" Load local configuration
source ~/.vimrc.local

