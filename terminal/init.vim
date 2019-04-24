" bclindner's init.vim/vimrc
" best used with neovim, but vim works fine too

" plugins (via vim-plug) {{{
" pre-plugin configuration {{{
filetype plugin indent on
let g:ale_completion_enabled = 1
" determine plugdir based on if we're using vim or not
if has('nvim')
  let s:plugdir = '~/.local/share/nvim/plugged'
else
  let s:plugdir = '~/.vim/plugged'
endif
" enable ale completion (must be done before plugin load)
let g:ale_completion_enabled = 1
" }}}
call plug#begin(s:plugdir)
  " the essentials {{{
  " vim-plug itself
  Plug 'junegunn/vim-plug'
  " better statusline
  Plug 'vim-airline/vim-airline'
  " tree browser
  Plug 'scrooloose/nerdtree'
  " fuzzy finder
  Plug 'ctrlpvim/ctrlp.vim'
  " syntax linting / LSP support
  Plug 'w0rp/ale'
  " autocompletion
  " Plug 'lifepillar/vim-mucomplete'
  " better buffer handling
  Plug 'moll/vim-bbye'
  " }}}
  " git support {{{
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " }}}
  " QoL {{{
  " commands for working w/ quotes, tags, etc
  Plug 'tpope/vim-surround'
  " block commenting controls
  Plug 'scrooloose/nerdcommenter'
  " nice starting screen
  Plug 'mhinz/vim-startify'
  " custom plugin to open vscode so my coworkers can edit my files
  Plug 'bclindner/vim-openvscode'
  " }}}
  " syntax & filetype support {{{
  Plug 'sheerun/vim-polyglot'
  Plug 'chemzqm/vim-jsx-improve'
  " xml autoclose/tag matching
  Plug 'Townk/vim-autoclose'
  Plug 'alvan/vim-closetag'
  " }}}
  " snippet support {{{
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'
  " }}}
  " custom colorschemes {{{
  " editor colorscheme
  Plug 'bclindner/vim-bclindner-colorscheme'
  " airline colorscheme
  Plug 'bclindner/vim-airline-bclindner'
  " }}}
call plug#end()
" }}} end vim-plug confaiguration

" general options {{{
" line options {{{
set list
set listchars=tab:→\ ,nbsp:●,trail:•,extends:⟩,precedes:⟨
set number
set linebreak
set showbreak="^^^"
set breakindent
" }}}
" QoL {{{
set confirm
set hidden
set splitbelow
set splitright
set nocompatible
" }}}
" search options {{{
set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch
" }}}
" indent options (default 2 spaces) {{{
set autoindent
set shiftwidth=2
set expandtab
set smartindent
set softtabstop=2
set tabstop=2
" }}}
" folding options {{{
set foldmethod=syntax
set nofoldenable
" }}}
" autocomplete options {{{
set completeopt=menu,menuone,preview,noselect,noinsert
set wildmode=longest,list,full
set shortmess+=c
set belloff+=ctrlg
" }}}
" miscellaneous {{{
colorscheme bclindner
" use mouse, because sometimes i'm just lazy
set mouse=a
" make backspace not stupid
set backspace=indent,eol,start
" syntax highlighting
syntax enable
" }}}
" end general options }}}

" plugin configuration {{{
" airline {{{
set laststatus=2
let g:airline_theme='bclindner'
" set airline symbols {{{
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
" enable airline bufferline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" }}}
" }}}
" nerdtree {{{
" git indicator symbols
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
" ale {{{
" linters and fixers {{{
let g:ale_linters = {
      \ 'javascript': ['tsserver'],
      \ }
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'json': ['prettier']
      \ }
" }}}
" options {{{
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 0
let g:ale_list_window_size = 3
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'
let g:airline#extensions#ale#enabled = 1
" }}}
" }}}
" ctrlp {{{
" ignore node_modules
set wildignore+=node_modules
" bind ctrl-p to ctrl-t (yeah i know lmfao)
nnoremap <C-t> :CtrlP<CR>
" }}}
" nerdcommenter {{{
" add space between comment boundary and text
let g:NERDSpaceDelims=1
" }}}
" mucomplete {{{
" let g:mucomplete#enable_auto_at_startup = 1
" }}}
" end plugin configuration }}}

" binds {{{
" splits {{{
" split movement
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>
" }}}
" buffers {{{
" C-w closes buffer with bbye
nnoremap <C-w> :Bdelete<CR>
" tab and shift-tab move buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
" }}}
" QOL binds {{{
" open :term (i don't use marker so :shrug:)
nnoremap ~ :15split\|term<CR>
nnoremap ` :term<CR>
" ALE
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gc :ALEDocumentation<CR>
nnoremap gh :ALEHover<CR>
" NERDtree
noremap gt :NERDTreeToggle<CR>
" F5 makes
noremap <F5> :make<CR>
" ESC returns from terminal insert mode
tnoremap <Esc> <C-\><C-n>
" <ESC> in normal mode ends search
nnoremap <Esc> :nohls<CR>
" }}}
" end binds }}}

" autocommands {{{
" open quickfix window when quickfix commands are run {{{
augroup OpenQuickfix
  autocmd!
  autocmd QuickFixCmdPost * copen
augroup END
" }}}
" for makefiles and go files: use noexpandtab {{{
augroup UseNoexpandtab
  autocmd!
  autocmd FileType go set noexpandtab
  autocmd FileType go set tabstop=2
  autocmd FileType make set noexpandtab
  autocmd FileType make set tabstop=2
augroup END
" }}}
" auto-apply dotfiles on save {{{
augroup AutoApplyDotfiles
  autocmd!
  autocmd BufWritePost ~/.Xresources* !xrdb -merge ~/.Xresources
  autocmd BufWritePost ~/.config/i3/config !i3-msg reload
  autocmd BufWritePost ~/.config/polybar/config !pkill -u $USER polybar && ~/.config/polybar/i3-launch.sh
augroup END
" }}}
" neovim only: make term behavior more convenient {{{
if has('neovim')
  augroup TermConfig
    autocmd!
    autocmd TermOpen * setlocal nonumber
    autocmd TermOpen * startinsert
    autocmd TermClose * bdelete!
  augroup END
endif
" }}}
" filetype autocmds {{{
" set make programs
augroup Makeprgs
  autocmd FileType python set makeprg=python\ %
  autocmd FileType javascript set makeprg=node\ %
  autocmd FileType go set makeprg=go\ run\ .
augroup END
" enforce 80 columns on markdown
autocmd FileType markdown set tw=80
" }}}
" }}} end autocommands

" custom commands {{{
" dotfile editing commands {{{
command! Vimrc e $MYVIMRC
command! VimrcUpdate source $MYVIMRC
command! Zshrc e ~/.zshrc
" }}}
" miscellaneous {{{
" convert a pure React component to class, with react-pure-to-class
command! -range ReactPureToClass <line1>,<line2>!react-pure-to-class
" get highlighting group under cursor (thanks vim wiki)
command! WhichHighlight :echom synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
" }}}
" end custom commands }}}


" vi: foldmethod=marker foldenable
