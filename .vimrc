set nocompatible

set runtimepath^=~/.vim/bundle/ctrlp.vim

syntax on
filetype on
filetype plugin on
filetype indent on

set history=1000
set showmatch
set matchtime=0
set shortmess=atI
set ruler
set number

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

" Buffer management
nmap H gT
nmap L gt

" Command-T
nmap <C-t> :CommandT<CR>
nmap <C-j> :CommandTBuffer<CR>

" Toggle highlighting
nmap <silent> <C-n> :silent :nohlsearch<CR>

nmap <C-h> ^
nmap <C-l> $

" Scroll faster
nore <C-e> 3<C-e>
nore <C-y> 3<C-y>

" % matches on if/else, html tags, etc.
runtime macros/matchit.vim

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

autocmd Filetype c,cc,cpp,h set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
"autocmd Filetype c,cc,cpp,h,sh set cindent autoindent
autocmd Filetype py,python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab
autocmd FileType fortran set expandtab shiftwidth=2 softtabstop=2
autocmd Filetype sh set ts=4 shiftwidth=4 expandtab
autocmd Filetype lisp,ruby,xml,html set ts=2 shiftwidth=2 expandtab
autocmd Filetype xml,xslt,diff,ruby set expandtab
autocmd BufRead *.asciidoc set filetype=asciidoc

" Keep ctags updated
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

" a.vim
nmap <silent> <Leader>h :A<CR>

set path+=.,**,./**,/usr/local/include,/usr/include
set complete-=i

source ~/.vimrc.local

