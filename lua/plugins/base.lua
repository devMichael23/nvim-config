vim.g.mapleader = ' '
local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
        autocmd BufWritePost base.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok = pcall(require, "packer")
if not status_ok then
    return
end



return require('packer').startup(function(use)
    ------------------------------------------------------------------------------
    -- Packer
    ------------------------------------------------------------------------------

    use 'wbthomason/packer.nvim'

    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

    ------------------------------------------------------------------------------
    -- Plugins for view
    ------------------------------------------------------------------------------

    use 'joshdick/onedark.vim' -- OneDark theme

    use 'folke/tokyonight.nvim' -- Tokyonight theme

    use {
        'nvim-lualine/lualine.nvim', -- InfoLine
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true -- Icons
        },
        config = function() require('lualine').setup() end,
    }

    use {
        'akinsho/bufferline.nvim', -- Tabs
        requires = 'kyazdani42/nvim-web-devicons', --Icons
        tag = "v2.*",
        config = function() require("bufferline").setup{} end
    }

    use {
        'kyazdani42/nvim-tree.lua', -- SourceTree
        requires = 'kyazdani42/nvim-web-devicons', -- Icnons
        config = function() require'nvim-tree'.setup{} end,
        tag = 'nightly'
    }

    use 'majutsushi/tagbar' -- Tags inside file

    use 'nvim-treesitter/nvim-treesitter' -- Syntax hightlight

    ------------------------------------------------------------------------------
    -- Plugins of IDE Options
    ------------------------------------------------------------------------------

    use {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        requires = 'nvim-lua/plenary.nvim' -- Lua module for asynchronous programming
    }

    use 'Raimondi/delimitMate' -- Auto close quotes, parenthesis, brackets, etc.

    use {
        'numToStr/Comment.nvim', -- Auto comments
        config = function() require('Comment').setup() end
    }

    use {
        'akinsho/toggleterm.nvim', -- Terminal in Neovim
        tag = 'v1.*'
    }

    use 'lukas-reineke/indent-blankline.nvim' -- Blankline & whitespace

    ------------------------------------------------------------------------------
    -- GIT
    ------------------------------------------------------------------------------

    use {
        'TimUntersberger/neogit', -- Full Git integration
        requires = 'nvim-lua/plenary.nvim'
    }

    use 'lewis6991/gitsigns.nvim' -- Show git changes

    use 'f-person/git-blame.nvim' -- Show git blame line

    use({
        "olimorris/persisted.nvim", -- Git sessions for branch
        config = function()
            require("persisted").setup()
            require("telescope").load_extension("persisted") -- Telescope extension
         end,
    })

    ------------------------------------------------------------------------------
    -- LSP
    ------------------------------------------------------------------------------

    use "neovim/nvim-lspconfig" -- LSP

    use "williamboman/nvim-lsp-installer" -- Installer servers for LSP

    ------------------------------------------------------------------------------
    -- AutoComplete
    ------------------------------------------------------------------------------

    use "hrsh7th/nvim-cmp" -- The completion plugin

    use "hrsh7th/cmp-buffer" -- Buffer completions

    use "hrsh7th/cmp-path" -- Path completions

    use "hrsh7th/cmp-cmdline" -- CMDline completions

    use "saadparwaiz1/cmp_luasnip" -- Snippet completions

    use "hrsh7th/cmp-nvim-lsp" -- LSP completions

    use "hrsh7th/cmp-nvim-lua" -- Lua completions

    use "L3MON4D3/LuaSnip" --Snippet engine

    use "rafamadriz/friendly-snippets" -- A bunch of snippets to use



    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

end)
