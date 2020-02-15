" ----------------------------------------
" Automatic installation of vim-plug, if it's not available
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"-----------------------------------------

"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
"-----------------------------------------

" -----------------------
" Plugins
" -----------------------

call plug#begin()

" UI
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

" Navigation
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Linting & syntax
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim'

" Other
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

" -----------------------
" Plugins configuration
" -----------------------

" UI

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Navigation

" Closes Neovim if only window open in NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Opens NerdTree when opening up Neovim
autocmd VimEnter * NERDTree

" -----------------------
" General settings
" -----------------------

" Set colour scheme
set background=dark
colorscheme nord

" Turns on syntax highlighting
syntax on

" Turns on autoindentation
set autoindent

" Indents with either tabs or spaces
set shiftwidth=2
set softtabstop=2

" Show bracket matches
set showmatch

" Shows line numbers
set number

" Cursor lines
set cursorline " highlight the current line the cursor is on
set cuc cul    " highlight the current column the cursor is on

" Enable auto-reading of files if they have been changed from the outside
set autoread

" Shows 80 chars column limit
set colorcolumn=80

" Use the system clipboard for yanking
set clipboard=unnamed

" Split new buffers to the right
set splitright

" Autocomplete commands
set showcmd
set wildmenu

" Hightlight search matches
set hlsearch

" Incremental search
set incsearch

" Case-insensitive searching
set ignorecase

" Use case-sensitive searching if expression contains capital letter
set smartcase

" Maps Ctrl+P to :FZF
map <C-P> :FZF<CR>

set termguicolors
" -----------------------
" How to restart
" -----------------------

" :source ~/.vimrc
" :PlugInstall
