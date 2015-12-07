set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Per project .lvimrc
Plugin 'embear/vim-localvimrc'

Plugin 'msanders/snipmate.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/ag.vim'
Plugin 'vim-scripts/lh-vim-lib'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-scripts/vim-auto-save'

Plugin 'godlygeek/tabular'
"Plugin 'majutsushi/tagbar'
"Plugin 'Chiel92/vim-autoformat'
Plugin 'plasticboy/vim-markdown'

Plugin 'michalbachowski/vim-wombat256mod'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/syntastic'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'Valloric/ListToggle'

Plugin 'rhysd/vim-clang-format'

call vundle#end()

au VimEnter * RainbowParenthesesToggle
au BufEnter * RainbowParenthesesLoadRound
au BufEnter * RainbowParenthesesLoadSquare
au BufEnter * RainbowParenthesesLoadBraces

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

" Alternatives to ESC:
inoremap jk <ESC>
"imap jlk <ESC>
"imap kjl <ESC>
"imap klj <ESC>
"imap lkj <ESC>
"imap ljk <ESC>
"imap ;l <ESC>

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Tab management
nmap H gT
nmap L gt

" Toggle highlighting
nmap <silent> <C-n> :silent :nohlsearch<CR>
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

" Whitespace management
highlight ExtraTabs ctermbg=236 guibg=236
highlight ExtraWhiteSpace ctermbg=red guibg=red

autocmd BufWinEnter * syntax match ExtraTabs /^\t\+/
autocmd BufWinEnter * syntax match ExtraWhiteSpace /^ \+\t\+\|\s\+$/

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

set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"autocmd Filetype c,cc,cpp,h set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
"autocmd Filetype c,cc,cpp,h,sh set cindent autoindent
"autocmd Filetype py,python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab
"autocmd FileType fortran set expandtab shiftwidth=2 softtabstop=2
"autocmd Filetype sh set ts=4 shiftwidth=4 expandtab
"autocmd Filetype lisp,ruby,xml,html set ts=2 shiftwidth=2 expandtab
"autocmd Filetype xml,xslt,diff,ruby set expandtab
"autocmd BufRead *.asciidoc set filetype=asciidoc

" a.vim
nmap <silent> <Leader>a :A<CR>

set path+=.,**,./**,/usr/local/include,/usr/include
set complete-=i

" localvimrc
let g:localvimrc_persistent=1

source ~/.vimrc.local

