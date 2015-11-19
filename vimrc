set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'firat/vim-bufexplorer'
Bundle 'tpope/vim-fugitive'
Bundle 'davidhalter/jedi-vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'Blackrush/vim-gocode'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-lua-inspect'

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
let g:jedi#auto_vim_configuration = 0
let g:vimclojure#HighlightContrib = 1
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#DynamicHighlighting = 1
let g:Powerline_symbols = 'fancy'

nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :TagbarToggle<CR>
nnoremap <leader>ntf :NERDTreeFocus<CR>
nnoremap <leader>ts :tabs<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tn :tabnext<CR>
