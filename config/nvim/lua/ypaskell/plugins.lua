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
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Dashboard is a nice start screen for nvim
    use("glepnir/dashboard-nvim")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("nvim-telescope/telescope-file-browser.nvim")

    use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting

    -- Productivity
    use("nvim-lualine/lualine.nvim") -- A better statusline

    -- File management --
    use("vifm/vifm.vim")
    use("scrooloose/nerdtree")
    use("tiagofumo/vim-nerdtree-syntax-highlight")
    use("ryanoasis/vim-devicons")

    -- Tim Pope Plugins --
    use("tpope/vim-surround")

    -- Syntax Highlighting and Colors --
    use("PotatoesMaster/i3-vim-syntax")
    use("kovetskiy/sxhkd-vim")
    use("vim-python/python-syntax")
    use("ap/vim-css-color")
    use("nickeb96/fish.vim")

    -- Junegunn Choi Plugins --
    use("junegunn/goyo.vim")
    use("junegunn/limelight.vim")
    use("junegunn/vim-emoji")

    -- Colorschemes --
    use("dracula/vim")
    use("morhetz/gruvbox")
    use("NLKNguyen/papercolor-theme")
    use("projekt0n/github-nvim-theme")

    -- Other stuff --

    if packer_bootstrap then
        packer.sync()
    end
end)

