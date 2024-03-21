-------------------------------------------------
-- YPASKELL'S NEOVIM CONFIGURATION
-------------------------------------------------

-------------------------------------------------
-- BASE SETTING
-------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.timeoutlen = 500 -- Decrease update time
vim.opt.updatetime = 100
vim.opt.history = 50     -- Remember 50 items in commandline history
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Better editor UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

-- Better editing experience
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.textwidth = 300

vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1 -- If negative, shiftwidth value is used

vim.opt.list = true
vim.opt.listchars = "eol:$,trail:★,tab:» "
vim.opt.formatoptions = 'qrn1'

vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.swapfile = false

vim.cmd("highlight EoLSpace ctermbg=DarkBlue guibg=DarkBlue")
vim.cmd("match EoLSpace /\\s\\+$/")

-- MARKDOWN
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

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

