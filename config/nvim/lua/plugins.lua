local lspconfig = require('config/lspconfig')
local treesitter = require('config/treesitter')
local bufferline = require('config/bufferline')
local cmp = require('config/cmp')
local lsp_signature = require('config/lsp_signature')
local tree = require('config/tree')

return require('packer').startup(function()
    use {
        'wbthomason/packer.nvim',
        opt = true
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = bufferline
    }
    use {
        'famiu/feline.nvim',
        after = 'gitsigns',
        setup = function() require'feline'.setup() end
    }
    use {
        'lewis6991/gitsigns.nvim',
        as = 'gitsigns',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = tree
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }
    use {
        'neovim/nvim-lspconfig',
        as = 'lspconfig',
        config = lspconfig,
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = "0.5-compat",
        as = 'treesitter',
        run = ':TSUpdate',
        config = treesitter
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer'},
        as = 'nvim-cmp',
        before = 'lspconfig',
        config = cmp
    }
    use {
        'hrsh7th/vim-vsnip',
        requires = 'hrsh7th/cmp-vsnip',
        after = 'nvim-cmp'
    }
    use {
        'ray-x/lsp_signature.nvim',
        config = lsp_signature,
        after = {'lspconfig', 'treesitter'}
    }
end)