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
set mouse=a
set hlsearch                " highlight search
set incsearch               " incremental search

""" setting for C++ google style
set tabstop=2               " number of columns occupied by a tab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set smarttab
set autoindent              " indent a new line the same amount as the line just typed

set showcmd
set showmode
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style

syntax on                   " syntax highlighting
"set clipboard=unnamedplus   " using system clipboard
filetype plugin indent on   "allow auto-indenting depending on file type
filetype indent on          " 啟用依照檔案類型，決定自動縮排樣式的功能
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
"set spell                 " enable spell check (may need to download language package)

""" Cursor
set cursorline
set cursorcolumn
hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White
hi CursorColumn cterm=none ctermbg=DarkMagenta ctermfg=White
set hlsearch

""" Trailing space
set list
set listchars=trail:▣,tab:▷▷

"#######################################################
" Colorscheme
"#######################################################
colo default
"colo gruvbox
"colo iceberg
"color meh
"colo candle-grey-transparent
"colo candle-grey
"colo PaperColor

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
" NERDTree Settings
"#######################################################
let NERDTreeShowHidden=6
let g:NERDTreeWinPos = "left"
"au VimEnter *  NERDTree  " auto open NERDTree when open neovim

"#######################################################
" Ale
"#######################################################
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
" let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'

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
