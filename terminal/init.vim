" bclindner vimrc

" plugins (via vim-plug)
filetype plugin indent on
call plug#begin('~/.local/share/nvim/plugged')
  "" vim-plug itself
  Plug 'junegunn/vim-plug'
  "" better statusline
  Plug 'vim-airline/vim-airline'
  Plug 'bclindner/vim-airline-bclindner'
  "" tree browser
  Plug 'scrooloose/nerdtree'
  "" fuzzy finder
  Plug 'ctrlpvim/ctrlp.vim'
  "" git support
  Plug 'airblade/vim-gitgutter'
  "" syntax linting / LSP support
  Plug 'w0rp/ale'
  "" autocompletion
  Plug 'lifepillar/vim-mucomplete'
  "" better buffer handling
  Plug 'moll/vim-bbye'
  "" commands for working w/ quotes, tags, etc
  Plug 'tpope/vim-surround'
  "" autoclosing
  Plug 'Raimondi/delimitMate'
  "" language support
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'digitaltoad/vim-pug'
  Plug 'mxw/vim-jsx'
call plug#end()
" end vim-plug configuration

" binds
"" NERDtree
noremap <C-t> :NERDTreeToggle<CR>
"" alt-movement between splits
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>
"" tab movement between buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
"" C-x closes buffer
nnoremap <C-x> :bdelete<CR>
"" F5 makes
noremap <F5> :make<CR>
" end binds

" general options
"" colorscheme
colorscheme zellner
"" line options
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set number
set linebreak
set showbreak=">>>"
set breakindent
set cursorline
"" QoL
set hidden
"" search options
set showmatch
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
set tabstop=2
"" autocomplete options
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
"" use mouse, because sometimes i'm just lazy
set mouse=a
"" make backspace not stupid
set backspace=indent,eol,start
"" syntax highlighting
syntax enable
"" for makefiles and go files: use noexpandtab
autocmd FileType go set noexpandtab
autocmd FileType go set tabstop=2
autocmd FileType make set noexpandtab
autocmd FileType make set tabstop=2
" auto-apply dotfiles on save
autocmd BufWritePost ~/.Xresources* !xrdb -merge ~/.Xresources
autocmd BufWritePost ~/.zshrc !source %
autocmd BufWritePost ~/.config/i3/config !i3-msg reload
autocmd BufWritePost ~/.config/polybar/config !pkill -u $USER polybar && ~/.config/polybar/i3-launch.sh
" enforce 80 columns on markdown
autocmd FileType markdown set tw=80
" end general options

" plugin configuration
"" airline stuff
set laststatus=2
let g:airline_theme='bclindner'
"" set airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.maxlinenr = '☰'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'
endif
"" enable airline bufferline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
"" nerdtree stuff
autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeWinPos = "right"
"" ale stuff
let g:ale_sign_column_always = 1
let g:ale_linters = {
  \ 'javascript': ['eslint', 'standard'],
\ }
let g:ale_sign_error = '✘'
let g:ale_sign_warning = 'ℹ️'
highlight ALEError ctermfg=black ctermbg=red cterm=bold
highlight ALEWarning ctermfg=black ctermbg=yellow cterm=bold
highlight ALEErrorSign ctermfg=red cterm=bold
highlight ALEWarningSign ctermfg=yellow cterm=bold
let g:ale_go_bingo_options = '-enable-global-cache'
let g:ale_go_gometalinter_options = '--fast --disable=vetshadow'
"" ctrlp stuff - ignore node_modules
set wildignore+=node_modules
" end plugin configuration


" custom commands
command! Vimrc e $MYVIMRC
command! VimrcUpdate source $MYVIMRC
command! Zshrc e ~/.zshrc
command! W w !sudo tee %
" end custom commands

" make configuration
autocmd FileType python set makeprg=python\ %
autocmd FileType javascript set makeprg=node\ %
autocmd FileType go set makeprg=go\ run\ .
" end make configuration

"gvim fix: set background color to black
highlight Normal guibg=#1d1f21 guifg=white

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
