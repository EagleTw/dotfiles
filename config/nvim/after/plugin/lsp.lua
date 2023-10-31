-------------------------------------------------
-- YPASKELL'S NEOVIM CONFIGURATION
-------------------------------------------------

-- COC

vim.cmd([[
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K', 'in')
        endif
    endfunction
    ]]
)

--local lsp_zero = require('lsp-zero')
--
--lsp_zero.on_attach(function(client, bufnr)
--    -- see :help lsp-zero-keybindings
--    -- to learn the available actions
--    lsp_zero.default_keymaps({buffer = bufnr})
--end)
--
---- don't need to customize the language servers
--lsp_zero.setup_servers({'clangd'})
--
--lsp_zero.set_preferences({
--    suggest_lsp_servers = false,
--    sign_icons = {
--        error = 'E',
--        warn = 'W',
--        hint = 'H',
--        info = 'I'
--    }
--})
--
---- Setup mason
--require('mason').setup({})
--require('mason-lspconfig').setup({
--    handlers = {
--        lsp_zero.default_setup,
--    },
--    ensure_installed = { "lua_ls", "clangd" },
--})
--
---- After setting up mason-lspconfig you may set up servers via lspconfig
--require('lspconfig').clangd.setup({
--    cmd = {
--        "clangd",
--        "--background-index",
--        "-std=c++17",
--    },
--    filetypes = {"c", "cpp", "h", "hpp"},
--    single_file_support = true,
--})
