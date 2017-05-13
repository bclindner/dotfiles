" plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"" let Vundle self-update
Plugin 'VundleVim/Vundle.vim'
"" use airline (powerline replacement)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"" git wrapper
Plugin 'tpope/vim-fugitive'
"" tree plugin
Plugin 'scrooloose/nerdtree'
"" syntax linter
Plugin 'vim-syntastic/syntastic'
"" tagbar (requires exuberant-ctags)
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on
" binds
"" tagbar
nmap <F8> :TagbarToggle<CR>
"" NERDtree
map <C-n> :NERDTreeToggle<CR>
"" alt-movement between splits
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" general options
"" powerline setting: laststatus
set laststatus=2
"" line options
set number
set linebreak
set showbreak=">>>"
set showmatch
set visualbell
"" search options
set nohlsearch
set smartcase
set ignorecase
set incsearch
"" set indent options (default 2 spaces)
set autoindent
set shiftwidth=2
set expandtab
set smartindent
set softtabstop=2
"" make backspace not stupid
set backspace=indent,eol,start
"" syntax highlighting
syntax enable
"" for makefiles: use noexpandtab
autocmd FileType make set noexpandtab
" plugin configuration
"" nerdtree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" airline stuff
let g:airline_theme='base16_twilight'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" define powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
