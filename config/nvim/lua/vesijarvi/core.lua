-------------------------------------------------
-- YPASKELL'S NEOVIM CONFIGURATION
-------------------------------------------------

-------------------------------------------------
-- BASE SETTING
-------------------------------------------------
local g = vim.g
local o = vim.o
local opt = vim.opt

--cmd('syntax on')
--vim.api.nvim_command('filetype plugin indent on')

o.termguicolors = true
o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 100

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.signcolumn = "yes"
o.cursorline = true
o.colorcolumn = "80"

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 8
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})


-- Highlight stuffs
o.list = true
o.listchars = "trail:◇,tab:→·"
o.formatoptions = 'qrn1'

vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=red")
vim.cmd("match ExtraWhitespace /\\s\\+$\\| \\+\\ze\\t\\|[^\\t]\\zs\\t\\+/")

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
-- BUG This option causes an error!
-- o.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1
opt.mouse = "a"

-- Map <leader> to space
--vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = true })
g.mapleader = " "
g.maplocalleader = " "
