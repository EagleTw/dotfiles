-------------------------------------------------
-- YPASKELL'S NEOVIM CONFIGURATION
-------------------------------------------------

-------------------------------------------------
-- BASE SETTING
-------------------------------------------------
--cmd('syntax on')
--vim.api.nvim_command('filetype plugin indent on')

vim.o.termguicolors = true
vim.o.background = 'dark'

-- Do not save when switching buffers
-- vim.o.hidden = true

-- Decrease update time
vim.o.timeoutlen = 500
vim.o.updatetime = 100

-- Number of screen lines to keep above and below the cursor
vim.o.scrolloff = 8

-- Better editor UI
vim.o.number = true
vim.o.relativenumber = false
vim.o.numberwidth = 2
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.colorcolumn = "80"

-- Better editing experience
vim.o.smarttab = true
vim.o.cindent = true
vim.o.autoindent = true
vim.o.wrap = true
vim.o.textwidth = 300

vim.o.expandtab = true
vim.o.tabstop = 8
vim.o.shiftwidth = 4
vim.o.softtabstop = -1 -- If negative, shiftwidth value is used

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
        callback = function()
            vim.opt.shiftwidth = 2
            vim.opt.tabstop = 2
            vim.opt.softtabstop = 2
            vim.g.expandtab = false
            --vim.cmd.colorscheme("github_dark_tritanopia")
    end,
})


-- Highlight stuffs
vim.o.list = true
vim.o.listchars = "eol:$,trail:★,tab:» "
vim.o.formatoptions = 'qrn1'

vim.cmd("highlight EoLSpace ctermbg=DarkBlue guibg=DarkBlue")
vim.cmd("match EoLSpace /\\s\\+$/")

-- Makes neovim and host OS clipboard play nicely with each other
vim.o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Undo and backup options
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.swapfile = false
-- vim.o.backupdir = '/tmp/'
-- vim.o.directory = '/tmp/'
-- vim.o.undodir = '/tmp/'

-- Remember 50 items in commandline history
vim.o.history = 50

-- Better buffer splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- Preserve view while jumping
-- BUG This option causes an error!
-- vim.o.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- vim.o.lazyredraw = true

-- Better folds (don't fold by default)
-- vim.o.foldmethod = 'indent'
-- vim.o.foldlevelstart = 99
-- vim.o.foldnestmax = 3
-- vim.o.foldminlines = 1
vim.opt.mouse = "a"

-- Map <leader> to space
--vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

