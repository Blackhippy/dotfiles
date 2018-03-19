call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-jedi'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'raimondi/delimitmate'

call plug#end()

colorscheme wal

" SETTINGS
let g:deoplete#enable_at_startup = 1
let g:neotags#python#order = 'mfc'

" Gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
" let g:gitgutter_sign_added = ''
" let g:gitgutter_sign_modified = ''
" let g:gitgutter_sign_removed = ''


filetype indent plugin on
syntax on
set nocompatible
set encoding=utf8
set hidden
set noswapfile
set autoindent
set wrap
set linebreak
set breakindent
set backspace=indent,eol,start
set expandtab
set softtabstop=0
set shiftwidth=4
set tabstop=4
set shiftround
set hlsearch
set incsearch
set ignorecase
set smartcase
set noruler
set nonumber
set mouse=a
set shortmess=atI
set hidden
set noshowmode

" sh fix
let g:is_posix=1


let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete= 1
