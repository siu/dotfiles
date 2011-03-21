set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on
 
set history=1000
set showmatch
set matchtime=0
set shortmess=atI
set ruler
set showcmd

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
 
" Allow switching edited buffers without saving
set hidden
 
" Look for the file in the current directory, then south until you reach home.
set tags=tags;~/
 
" Change <Leader>
let mapleader = ","
nore ; :
nore , ;
 
" Quick timeouts on key combinations.
set timeoutlen=300
 
" Alternatives to ESC:
"imap jkl <ESC>
"imap jlk <ESC>
"imap kjl <ESC>
"imap klj <ESC>
"imap lkj <ESC>
"imap ljk <ESC>
"imap ;l <ESC>
 
" "Very magic" regexes in searches
" nnoremap / /\v
" nnoremap ? ?\v
 
" Vi-style editing in the command-line
"nnoremap : q:a
"nnoremap / q/a
"nnoremap ? q?a
 
" Lusty
"let g:LustyJugglerShowKeys = 2
" let g:LustyExplorerSuppressRubyWarning = 1
"let g:LustyExplorerFileMasks = "*.o,*.fasl"
" nmap <silent> <Leader>f :FilesystemExplorer<CR>
" nmap <silent> <Leader>b :BufferExplorer<CR>
" nmap <silent> <Leader>r :FilesystemExplorerFromHere<CR>
" nmap <silent> <Leader>g :LustyJuggler<CR>
" nmap <silent> <Leader>j :so ~/.vim/plugin/lusty-explorer.vim<CR>
" nmap <silent> <TAB> :JugglePrevious<CR>
 
" Window management
"nmap <silent> <Leader>xo :wincmd j<CR>
 
" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
 
" Fix command typos (stolen from Adam Katz)
nmap ; :
 
" ` is more useful than ' but less accessible.
" nnoremap ' `
" nnoremap ` '
 
" Buffer management
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
"nmap <TAB> :b#<CR>
"nmap <C-q> :bd<CR>
nmap <C-d> :bw<CR>
vmap <C-d> :bw<CR>
 
" Toggle highlighting
" nmap <silent> <C-n> :silent :set nohls!<CR>:silent :set nohls?<CR>
nmap <silent> <C-n> :silent :nohlsearch<CR>
 
nmap H ^
nmap L $
 
" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>
 
" % matches on if/else, html tags, etc.
runtime macros/matchit.vim
 
" Bash-like filename completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.fasl
 
autocmd BufRead *.qcf set filetype=lisp
autocmd BufRead qpx.inc set filetype=make
autocmd BufRead letter* set filetype=mail
autocmd Filetype mail set fo -=l autoindent spell
 
" ITA indenting style
autocmd Filetype c,cpp,h set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" JSH indenting style
"autocmd Filetype c,cpp,h set tabstop=8 softtabstop=4 shiftwidth=4 noexpandtab
" Wimba indenting style, sort-of
"autocmd Filetype c,cpp,h set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" Viewglob
"autocmd Filetype c,cpp,h,sh set cindent autoindent
autocmd Filetype py,python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab
autocmd FileType fortran set expandtab shiftwidth=2 softtabstop=2
autocmd Filetype sh set ts=4 shiftwidth=2 expandtab
autocmd Filetype lisp,ruby,xml,html set ts=8 shiftwidth=2 expandtab
autocmd Filetype xml,xslt,diff,ruby set expandtab
autocmd BufReadPre viper,.viper set filetype=lisp
 
" a.vim
nmap <silent> <Leader>h :A<CR>
 
" Indent XML readably
function! DoPrettyXML()
  1,$!xmllint --format --recover -
endfunction
command! PrettyXML call DoPrettyXML()


"  set nocompatible
"  set showtabline=2
"  set ts=8

set path+=.,**,./**,,/usr/local/include,/usr/include

" Gvim
if has('gui_running')
  set t_Co=256
  set encoding=utf-8
  set cursorline
  set guioptions-=m  " no menubar
  set guioptions-=T  " no toolbar
  set gfn=Terminus\ 10
endif

