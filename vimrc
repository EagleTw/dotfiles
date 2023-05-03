"#######################################################
set nocompatible
"#######################################################
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
set autowrite
set mouse=a
set incsearch            "在關鍵字尚未完全輸入完畢前就顯示結果
filetype indent on       "啟用依照檔案類型，決定自動縮排樣式的功能


""" Trailing space
set list
set listchars=trail:▣,tab:▷▷

"#######################################################
" Color
set t_Co=256
colo desert
set cursorline
hi CursorLine cterm=underline ctermbg=none ctermfg=none
"set cursorcolumn
set hlsearch
hi Search cterm=reverse ctermbg=none ctermfg=none

"#######################################################
" statusline
set laststatus=2
set statusline=%#filepath#[%{expand('%:p')}]%#filetype#[%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%#filesize#%{FileSize()}%{IsBinary()}%=%#position#%c,%l/%L\ [%3p%%]
hi filepath cterm=none ctermbg=238 ctermfg=40
hi filetype cterm=none ctermbg=238 ctermfg=45
hi filesize cterm=none ctermbg=238 ctermfg=225
hi position cterm=none ctermbg=238 ctermfg=228

"#######################################################
" F1-F12_HOTKEY_SETTINGS:
"#######################################################

"Remove all trailing whitespace
nmap <F12> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
