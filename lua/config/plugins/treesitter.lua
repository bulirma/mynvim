local config = function()
    require('nvim-treesitter.configs').setup({
        indent = { enable = true },
        ensure_installed = {
            'lua', 'python'
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    })
end

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = config,
    build = ':TSUpdate'
}
