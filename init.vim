"**************************************************
" Author:         ypprog                          *
" E-mail:         pan.yiping.fi@gmail.com         *
" Date:           2022-11-22                      *
" Description:                                    *
" Copyright 2022 by ypprog. All Rights Reserved   *
"**************************************************
" Reference: https://github.com/Blacksuan19/init.nvim
" https://github.com/mcchrish/vim-no-color-collections

"#######################################################
" Basic Settings
"#######################################################
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
filetype indent on          " 啟用依照檔案類型，決定自動縮排樣式的功能
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
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

""" Trailing space
set list
set listchars=trail:▣,tab:▷▷⋮

"#######################################################
" Plugin Settings
"#######################################################
call plug#begin()
 " Plugin Section

  """ Aesthetics - Colorschemes
  Plug 'dracula/vim'                " Color scheme
  Plug 'morhetz/gruvbox'            " Color scheme
  Plug 'cocopon/iceberg.vim'
  Plug 'davidosomething/vim-colors-meh' " Very minimal color
  Plug 'aditya-azad/candle-grey'    " Minimal grey color
  Plug 'NLKNguyen/papercolor-theme'


  """ Aesthetics - Others
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'    " Colorfull status bar

  """ Functionalities
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mhinz/vim-startify'         " cool start up screen
  Plug 'tpope/vim-fugitive'         " git support
  Plug 'psliwka/vim-smoothie'       " some very smooth ass scrolling
  Plug 'scrooloose/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug 'preservim/tagbar'

  """For language support
  Plug 'cespare/vim-toml'
  Plug 'dense-analysis/ale'

call plug#end()

"#######################################################
" Colorscheme
"#######################################################
"colo desert
"colo gruvbox
"colo iceberg
"color meh
"colo candle-grey-transparent
"colo candle-grey
colo PaperColor

"#######################################################
" NERDTree Settings
"#######################################################
let NERDTreeShowHidden=6
let g:NERDTreeWinPos = "left"
"au VimEnter *  NERDTree  " auto open NERDTree when open neovim

"#######################################################
" AirLine Setting
"#######################################################
" let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"#######################################################
" Ale
"#######################################################
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
" let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚠️'

" remove_trailing_lines 刪除文件末尾的所有空白行
" trim_whitespace 刪除每行末尾的所有尾隨空格字元
" let g:ale_fixers = {
"     \ '*': ['remove_trailing_lines', 'trim_whitespace'],
" \}

"#######################################################
" Navigate snippet placeholders using tab
"#######################################################
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
"let g:coc_disable_startup_warning = 1    " diable warning

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-pyright',
            \'coc-clangd',
            \'coc-prettier',
            \'coc-xml',
            \'coc-syntax',
            \'coc-git',
            \'coc-marketplace',
            \'coc-highlight',
            \'coc-sh',
            \]

"#######################################################
" custom banner
"#######################################################
let g:startify_custom_header = [
 \ '',
 \ '                                                    ▟▙            ',
 \ '                                                    ▝▘            ',
 \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \ '',
 \ '',
 \]

"#######################################################
" Auto Shell comment.
"#######################################################
autocmd BufNewFile *.sh,*.py,*.[ch],*.cpp,*.md exec ":call SetTitle()"
func SetTitle()
if expand("%:e") == 'sh'
  call setline(1,"#!/bin/bash")
  call setline(2,"#")
  call setline(3,"#**************************************************")
  call setline(4,"# Author:         ypaskell                        *")
  call setline(5,"# E-mail:         pan.yiping.fi@gmail.com         *")
  call setline(6,"# Date:           ".strftime("%Y-%m-%d")."                      *")
  call setline(7,"# Description:                                    *")
  call setline(8,"# Copyright ".strftime("%Y"). " by ypaskell. All Rights Reserved   *")
  call setline(9,"#**************************************************")
  call setline(10,"")
  call setline(11,"")
endif
if expand("%:e") == 'py'
  call setline(1, "\# -*- coding: utf-8 -*-")
  call setline(2,"#")
  call setline(3,"#**************************************************")
  call setline(4,"# Author:         ypaskell                        *")
  call setline(5,"# E-mail:         pan.yiping.fi@gmail.com         *")
  call setline(6,"# Date:           ".strftime("%Y-%m-%d")."                      *")
  call setline(7,"# Description:                                    *")
  call setline(8,"# Copyright ".strftime("%Y"). " by ypaskell. All Rights Reserved   *")
  call setline(9,"#**************************************************")
  call setline(10,"")
  call setline(11,"")
endif
if expand("%:e") == 'md'
  call setline(2,"#")
  call setline(3,"#************************************************* <br>")
  call setline(4,"# Author:         ypaskell                         <br>")
  call setline(5,"# E-mail:         pan.yiping.fi@gmail.com          <br>")
  call setline(6,"# Date:           ".strftime("%Y-%m-%d")."         <br>")
  call setline(7,"# Description:                                     <br>")
  call setline(8,"# Copyright ".strftime("%Y"). " by ypaskell. All Rights Reserved <br>")
  call setline(9,"#************************************************* <br>")
  call setline(10,"")
  call setline(11,"")
endif

autocmd BufNewFile * normal G
endfunc

"#######################################################
" F1-F12_HOTKEY_SETTINGS:
"#######################################################
nmap <F2> :exec 'NERDTreeToggle' <CR>
nmap <F3> :TagbarToggle <CR>

"Remove all trailing whitespace
nmap <F12> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"#######################################################
" switch between splits using ctrl + {h,j,k,l}
"#######################################################
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"#######################################################
" Raw stirng search :SS <\foo> 
"#######################################################
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')|set hlsearch
