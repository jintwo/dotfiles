set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'mitsuhiko/vim-python-combined'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'firat/vim-bufexplorer'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'

set encoding=utf-8
set showcmd
set number
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set t_Co=256
set hlsearch
set incsearch
set ignorecase
set smartcase
set guifont=Source\ Code\ Pro:h11
set laststatus=2
set background=dark

syntax enable
"let g:solarized_termcolors = 256
colorscheme solarized

filetype plugin indent on

let mapleader = ","
let g:pymode_lint_write = 1
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:Powerline_symbols = 'fancy'

nmap <F5> :NERDTreeToggle<CR>
nnoremap <leader>ntf :NERDTreeFocus<CR>
nnoremap <leader>ts :tabs<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tn :tabnext<CR>
