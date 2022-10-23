set t_Co=256
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed


" Reletive nu settings
set number                  " add line numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
"set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin()
 " Plugin Section

 " Apprearence
  Plug 'dracula/vim'                " Color scheme
  Plug 'morhetz/gruvbox'            " Color scheme
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'    " Colorfull status bar
  Plug 'elvessousa/sobrio'

  "Plug 'Fugitive'                  " git in vim
  Plug 'scrooloose/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'

call plug#end()

" color schemes
" colorscheme evening
" colorscheme gruvbox
colorscheme sobrio

"==============================================================================
" NERDTree Settings
let NERDTreeShowHidden=6
let g:NERDTreeWinPos = "right"
"au VimEnter *  NERDTree  " auto open NERDTree when open neovim
nnoremap <F5> :exec 'NERDTreeToggle' <CR>

"==============================================================================
" AirLine Setting 
let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"==============================================================================
" Show trailing space
set list
set listchars+=trail:▣

"Remove all trailing whitespace by pressing
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
