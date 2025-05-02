-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use ({ "tjdevries/gruvbuddy.nvim", requires = "tjdevries/colorbuddy.vim" })
    --use ({'alljokecake/naysayer-theme.nvim', as = 'naysayer'})
    use {
        "whizikxd/naysayer-colors.nvim",
        config = function()
            vim.cmd.colorscheme("naysayer")
        end
    }
    use 'AlexvZyl/nordic.nvim'
    use 'bettervim/yugen.nvim'
    use {
        'olivercederborg/poimandres.nvim',
        config = function()
            require('poimandres').setup {
                -- leave this setup function empty for default config
                -- or refer to the configuration section
                -- for configuration options
            }
        end
    }
    use {
        "mcchrish/zenbones.nvim",
        requires = "rktjmp/lush.nvim"
    }
    use 'nvim-lua/plenary.nvim'
    use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use {'theprimeagen/harpoon'}
    use {'tpope/vim-dadbod'}
    use {'kristijanhusak/vim-dadbod-ui'}
    use {'maxmellon/vim-jsx-pretty'}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)
