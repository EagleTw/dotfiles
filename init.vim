set t_Co=256
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed

set number                  " add line numbers
nnoremap <F4> :exec 'set nonu' <CR>


set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin()
 " Plugin Section
 
 " Apprearence 
  Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'            " Color scheme
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'    " Colorfull status bar
  Plugin 'vim-airline/vim-airline-themes'

  "Plug 'Fugitive'                  " git in vim
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'scrooloose/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
call plug#end()

" color schemes
" colorscheme evening
" colorscheme dracula
colorscheme gruvbox

" File browser
let NERDTreeShowHidden=6
" au VimEnter *  NERDTree  " auto open NERDTree when open neovim
nnoremap <F5> :exec 'NERDTreeToggle' <CR>

" AirLine Setting 
let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
