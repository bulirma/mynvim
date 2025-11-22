local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('kanagawa-dragon')
        end
    },

    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {
            padding = false
        }
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {}
    },

    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        opts = {
            options = {
                icons_enabled = true,
                globalstatus = true,
                theme = 'kanagawa',
                component_separators = {
                    left = '|',
                    ritgh = '|'
                },
                section_separators = {
                    left = '',
                    right = ''
                }
            }
        }
    },

    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        config = function()
            require('nvim-tree').setup({
                filters = {
                    dotfiles = false
                }
            })
            require('config.keymaps').setup_nvim_tree()
        end
    },

    {
        'nvim-tree/nvim-web-devicons'
    },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        config = function()
            require('nvim-treesitter.configs').setup({
                indent = { enable = true },
                --autotag = { enable = true },
                ensure_installed = {
                    'lua', 'python',
                    'vim', 'vimdoc',
                    'markdown', 'yaml', 'json', 'html', 'css',
                    'c', 'cpp', 'rust', 'go',
                    'c_sharp', 'haskell',
                    'bash', 'make', 'cmake',
                    'typescript', 'scss'
                },
                auto_install = true,
                highligh = {
                    enable = true,
                    disable = function(lang, _)
                        if lang == "html" then
                            return true
                        end
                        return false
                    end
                }
            })
        end,
        build = ':TSUpdate'
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },

    {
        'windwp/nvim-ts-autotag',
        lazy = false,
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require('nvim-ts-autotag').setup()
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local builtin = require('telescope.builtin')
            require('config.keymaps').setup_telescope(builtin)
        end
    },

    {
        'folke/neodev.nvim'
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim',
            'folke/neodev.nvim'
        }
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets'
        }
    }
}, {
    defaults = { lazy = false }
})

local M = {}

return M
