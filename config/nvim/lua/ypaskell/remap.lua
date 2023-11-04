-------------------------------------------------
-- YPASKELL'S NEOVIM CONFIGURATION
-------------------------------------------------

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Mimic shell movements
map("i", "<C-E>", "<ESC>A")
map("i", "<C-A>", "<ESC>I")

-- Split
map("n", "<leader>hs", "<C-w>s")
map("n", "<leader>vs", "<C-w>v")

map("n", "<F2>", ":NERDTreeToggle<CR>") -- Nerdtree
map("n", "<F3>", ":SymbolsOutline<CR>") -- Outline
map("n", "<F12>", [[:%s/\s\+$//e<cr>]]) -- Remove trailing whitespace

-- Raw stirng search :SS <\foo>
vim.cmd([[
    command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')|set hlsearch

    if &term =~ "ansi"
        let &t_ti = "\<Esc>[?47h"
        let &t_te = "\<Esc>[?47l"
    endif
    ]]
)
