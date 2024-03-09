-------------------------------------------------
-- YPASKELL'S NEOVIM CONFIGURATION
-------------------------------------------------

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

map('n', '<leader>hs', '<C-w>s')             -- Horizontal split
map('n', '<leader>vs', '<C-w>v')             -- Vertical split
map('n', '<Leader>wt', [[:%s/\s\+$//e<cr>]]) -- Remove trailing whitespace

-- Split movements
map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')

-- Self
map('n', '<F2>', ':NERDTreeToggle<CR>')       -- Nerdtree
map('n', '<leader>nt', ':NERDTreeToggle<CR>') -- Nerdtree
map('n', '<F3>', ':SymbolsOutline<CR>')       -- Outline
map('n', '<leader>srn', ':set rnu!<CR>')      -- Toogle reletive number

-- Raw stirng search :SS <\foo>
vim.cmd([[
    command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')|set hlsearch

    if &term =~ "ansi"
        let &t_ti = "\<Esc>[?47h"
        let &t_te = "\<Esc>[?47l"
    endif
    ]]
)
