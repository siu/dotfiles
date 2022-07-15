set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Per project .lvimrc
Plug 'embear/vim-localvimrc'
Plug 'msanders/snipmate.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/ag.vim'
Plug 'vim-scripts/lh-vim-lib'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'Valloric/ListToggle'
"Plug 'vim-scripts/vim-auto-save'

" Snippets
Plug 'msanders/snipmate.vim'

" Formatting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Chiel92/vim-autoformat'

" Styling
Plug 'michalbachowski/vim-wombat256mod'

" Status bar
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Debugging
Plug 'puremourning/vimspector'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" File navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
"Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin

" Lang: C
Plug 'vim-scripts/a.vim'

" Lang: Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
set cursorline


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

" Quick timeouts on key combinations.
set timeoutlen=300

" Bash-like filename completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.so,*.d,*.a,*~,*.pyo,*.pyc

" Long line guide
set colorcolumn=+1
set textwidth=100

" Style
" Global tab/space configuration
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
" avoid automatic line breaks
set formatoptions-=t

" Gvim
if has('gui_running')
	set t_Co=256
	set encoding=utf-8
	set guioptions-=m  " no menubar
	set guioptions-=T  " no toolbar
endif

colorscheme wombat256mod

" Change <Leader>
let mapleader = ","
nore ; :
nore , ;

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

" Highlight whitespace
"highlight ExtraTabs ctermbg=235
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

" a.vim
nmap <silent> <Leader>a :A<CR>

set path+=.,**,./**,/usr/local/include,/usr/include
set complete-=i

" localvimrc
let g:localvimrc_persistent=1

" Rainbow parentheses
let g:rainbow_active = 1

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" quickfix list
map <leader>co :copen<CR>
map <leader>cc :cclose<CR>
map <leader>cn :cnext<CR>
map <leader>cp :cprevious<CR>

" spelling
nmap <silent> <leader>s :set spell!<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tagbar', 'ctrlp', 'nvimlsp', 'quickfix']

" vim-go
let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1

" Load local configuration
source ~/.vimrc.local

