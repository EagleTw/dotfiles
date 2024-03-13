-------------------------------------------------
-- YPASKELL")
-------------------------------------------------

local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end


-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
        autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
     augroup END
]])


packer.startup(function(use)
    -- Packer can manage itself --
    use("wbthomason/packer.nvim")

    -------------- Development Experience --------------
    -- Telescope
    use ("nvim-lua/plenary.nvim")
    use ("nvim-treesitter/nvim-treesitter") -- syntax highlighting
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use("scrooloose/nerdtree")           -- Nerdtree
    use("lewis6991/gitsigns.nvim")       -- git integration
    use("chentoast/marks.nvim")          -- Marking
    use('vimwiki/vimwiki')

    use {
        'simrat39/symbols-outline.nvim', -- markdown outline
        require("symbols-outline").setup()
    }
    use {                                -- Alignment
        'Vonr/align.nvim',
        branch = "v2",
    }


    -------------- Language Servers --------------
    --use {'neoclide/coc.nvim', branch = 'release'}
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -------------- Colorschemes --------------
    --use("morhetz/gruvbox")
    --use("NLKNguyen/papercolor-theme")
    use("projekt0n/github-nvim-theme")
    use("blazkowolf/gruber-darker.nvim")
    use("catppuccin/nvim")
    --use({ 'rose-pine/neovim', as = 'rose-pine' })

    -------------- Other stuff --------------
    if packer_bootstrap then
        packer.sync()
    end
end)


