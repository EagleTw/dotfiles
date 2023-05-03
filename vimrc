"#######################################################
set nocompatible
syntax enable
"set number
"set noruler
set cc=80
set ignorecase
set smartcase
set incsearch
set cindent
"set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set confirm
set backspace=indent,eol,start
set history=500
set showcmd
set showmode
set wrap                 "字數過長時換行
set nu
set autowrite
set mouse=a
set incsearch            "在關鍵字尚未完全輸入完畢前就顯示結果
filetype indent on       "啟用依照檔案類型，決定自動縮排樣式的功能


""" Trailing space
set list
set listchars=trail:▣,tab:▷▷

"#######################################################
" Color
"#######################################################
set t_Co=256
" colo ron 
colo gruvbox 
set cursorline
hi CursorLine cterm=underline ctermbg=none ctermfg=none
"set cursorcolumn
set hlsearch
hi Search cterm=reverse ctermbg=none ctermfg=none

"#######################################################
" Plugin Settings
"#######################################################
call plug#begin()
 " Plugin Section

  """ Aesthetics - Colorschemes
  Plug 'morhetz/gruvbox'            " Color scheme
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'altercation/vim-colors-solarized'
  Plug 'dikiaap/minimalist'

  """ Functionalities
  Plug 'mhinz/vim-startify'         " cool start up screen
  Plug 'scrooloose/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'octol/vim-cpp-enhanced-highlight'

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
" F1-F12_HOTKEY_SETTINGS:
"#######################################################
nmap <F2> :exec 'NERDTreeToggle' <CR>
nmap <F3> :TagbarToggle <CR>

"Remove all trailing whitespace
nmap <F12> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>