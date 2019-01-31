" bclindner's init.vim/vimrc
" vi: foldmethod=marker foldenable

" plugins (via vim-plug) {{{
filetype plugin indent on
let g:ale_completion_enabled = 1
call plug#begin('~/.local/share/nvim/plugged')
  "" vim-plug itself
  Plug 'junegunn/vim-plug'
  "" better statusline
  Plug 'vim-airline/vim-airline'
  Plug 'bclindner/vim-airline-bclindner'
  "" tree browser
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  "" block commenting controls
  Plug 'scrooloose/nerdcommenter'
  "" fuzzy finder
  Plug 'ctrlpvim/ctrlp.vim'
  "" git support
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  "" syntax linting / LSP support
  Plug 'w0rp/ale'
  "" autocompletion
  Plug 'lifepillar/vim-mucomplete'
  "" better buffer handling
  Plug 'moll/vim-bbye'
  "" commands for working w/ quotes, tags, etc
  Plug 'tpope/vim-surround'
  "" html autoclose/tag matching
  Plug 'Townk/vim-autoclose'
  Plug 'alvan/vim-closetag'
  "" language support
  Plug 'sheerun/vim-polyglot'
  Plug 'chemzqm/vim-jsx-improve'
  "" nice starting screen
  Plug 'mhinz/vim-startify'
  "" snippets
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'
  "" custom colorscheme
  Plug 'bclindner/vim-bclindner-colorscheme'
  "" open vscode plugin
  Plug '~/git/vim-openvscode'
call plug#end()
" }}} end vim-plug configuration

" plugin configuration {{{
"" airline stuff
set laststatus=2
let g:airline_theme='bclindner'
"" set airline symbols {{{
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
endif " }}}
"" set nerdtree git indicator symbols {{{
let s:NERDTreeIndicatorMap = {
  \ 'Modified'  : '*',
  \ 'Staged'    : '+',
  \ 'Untracked' : '~',
  \ 'Renamed'   : ',',
  \ 'Unmerged'  : '═',
  \ 'Deleted'   : 'X',
  \ 'Dirty'     : 'x',
  \ 'Clean'     : 'c',
  \ 'Ignored'   : 'i',
  \ 'Unknown'   : '?'
  \ } " }}}
"" enable airline bufferline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
"" }}}
"" ale stuff {{{
let g:ale_sign_column_always = 1
let g:ale_linters = {
      \ 'javascript': ['tsserver', 'eslint'],
      \ }
let g:ale_fixers = {
      \ 'javascript': ['prettier']
      \ }
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'
let g:ale_open_list = 1
"" }}}
"" ctrlp stuff - ignore node_modules
set wildignore+=node_modules
" end plugin configuration }}}

" binds {{{
"" alt-movement between splits {{{
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>
"" }}}
"" tab movement between buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
"" open :term
noremap ~ :15split\|term<CR>
"" NERDtree
noremap <C-t> :NERDTreeToggle<CR>
"" C-x closes buffer with bbye
nnoremap <C-x> :Bdelete<CR>
"" F5 makes
noremap <F5> :make<CR>
"" ESC returns from terminal insert mode
tnoremap <Esc> <C-\><C-n>
"" <ESC> in normal mode ends search
nnoremap <Esc> :nohls<CR>
" end binds }}}

" general options {{{
"" colorscheme
colorscheme bclindner
"" line options {{{
set list
set listchars=tab:→\ ,nbsp:•,trail:␣,extends:⟩,precedes:⟨
set number
set linebreak
set showbreak="^^^"
set breakindent
"" }}}
"" QoL {{{
set confirm
set hidden
set splitbelow
set splitright
"" }}}
"" search options {{{
set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch
"" }}}
"" indent options (default 2 spaces) {{{
set autoindent
set shiftwidth=2
set expandtab
set smartindent
set softtabstop=2
set tabstop=2
"" }}}
"" folding options {{{
set foldmethod=syntax
set nofoldenable
"" }}}
"" autocomplete options {{{
set completeopt=menu,menuone,preview,noselect,noinsert
set wildmode=longest,list,full
set shortmess+=c
set belloff+=ctrlg
"" }}}
"" use mouse, because sometimes i'm just lazy
set mouse=a
"" make backspace not stupid
set backspace=indent,eol,start
"" syntax highlighting
syntax enable
" end general options }}}

" autocommands {{{
"" for makefiles and go files: use noexpandtab {{{
augroup UseNoexpandtab
  autocmd!
  autocmd FileType go set noexpandtab
  autocmd FileType go set tabstop=2
  autocmd FileType make set noexpandtab
  autocmd FileType make set tabstop=2
augroup END
"" }}}
"" auto-apply dotfiles on save {{{
augroup AutoApplyDotfiles
  autocmd!
  autocmd BufWritePost ~/.Xresources* !xrdb -merge ~/.Xresources
  autocmd BufWritePost ~/.config/i3/config !i3-msg reload
  autocmd BufWritePost ~/.config/polybar/config !pkill -u $USER polybar && ~/.config/polybar/i3-launch.sh
augroup END
"" }}}
"" make term behavior more convenient {{{
augroup TermConfig
  autocmd!
  autocmd TermOpen * setlocal nonumber
  autocmd TermOpen * startinsert
  autocmd TermClose * bdelete!
augroup END
"" }}}
"" automatic views {{{
augroup AutoViews
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent loadview
augroup END
"" }}}
"" enforce 80 columns on markdown
autocmd FileType markdown set tw=80
" }}} end autocommands

" custom commands {{{
"" dotfile editing commands {{{
command! Vimrc e $MYVIMRC
command! VimrcUpdate source $MYVIMRC
command! Zshrc e ~/.zshrc
"" }}}
"" convert a pure React component to class, with react-pure-to-class
command! -range ReactPureToClass <line1>,<line2>!react-pure-to-class
"" get highlighting group under cursor (thanks vim wiki)
command! WhichHighlight :echom synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
" end custom commands }}}

" make configuration {{{
augroup Makeprgs
  autocmd FileType python set makeprg=python\ %
  autocmd FileType javascript set makeprg=node\ %
  autocmd FileType go set makeprg=go\ run\ .
augroup END
" end make configuration }}}
