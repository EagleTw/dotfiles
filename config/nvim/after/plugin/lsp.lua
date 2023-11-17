-------------------------------------------------
-- YPASKELL'S NEOVIM CONFIGURATION
-------------------------------------------------

-- COC
--vim.cmd([[
--    " Use `[g` and `]g` to navigate diagnostics
--    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
--    nmap <silent> [g <Plug>(coc-diagnostic-prev)
--    nmap <silent> ]g <Plug>(coc-diagnostic-next)
--
--    " GoTo code navigation
--    nmap <silent> gd <Plug>(coc-definition)
--    nmap <silent> gy <Plug>(coc-type-definition)
--    nmap <silent> gi <Plug>(coc-implementation)
--    nmap <silent> gr <Plug>(coc-references)
--
--    " Use K to show documentation in preview window
--    nnoremap <silent> K :call ShowDocumentation()<CR>
--
--    function! ShowDocumentation()
--        if CocAction('hasProvider', 'hover')
--            call CocActionAsync('doHover')
--        else
--            call feedkeys('K', 'in')
--        endif
--    endfunction
--    ]]
--)

-- lsp zero

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    -- lsp_zero.default_keymaps({buffer = bufnr})
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "<leader>go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    -- vim.keymap.set("n", "<leader>fd", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
    vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
    vim.keymap.set("n", "<leader>g[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
    vim.keymap.set("n", "<leader>g]", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
end)

-- don't need to customize the language servers
lsp_zero.setup_servers({'clangd'})

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
    }
})

-- Setup mason
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
    },
    ensure_installed = { "lua_ls", "clangd" },
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
require('lspconfig').clangd.setup({
    cmd = {
        "clangd",
        --"/u/yuecheng/bin/clangd-util-vcs/client/vcsClangd", -- for snps
        "--background-index",
    },
    filetypes = {"c", "cpp", "h", "hpp"},
    single_file_support = true,
})
