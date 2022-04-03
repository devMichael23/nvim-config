vim.g.mapleader = ' '
local fn = vim.fn
local execute = vim.api.nvim_command


-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function() 
    ------------------------------------------------------------------------------
    -- Packer
    ------------------------------------------------------------------------------

    use 'wbthomason/packer.nvim'

    ------------------------------------------------------------------------------
    -- Plugins for view
    ------------------------------------------------------------------------------

    use 'joshdick/onedark.vim' -- OneDark theme

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
        config = function() require("bufferline").setup{} end,
    }

    use {
        'kyazdani42/nvim-tree.lua', -- SourceTree
        requires = 'kyazdani42/nvim-web-devicons', -- Icnons
        config = function() require'nvim-tree'.setup{} end,
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

    use 'akinsho/toggleterm.nvim' -- Terminal in Neovim

end)

