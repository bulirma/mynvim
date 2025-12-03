return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
        options = {
            icons_enabled = true,
            globalstatus = true,
            theme = 'kanagawa',
            component_separators = {
                left = '|',
                right = '|'
            },
            section_separators = {
                left = '',
                right = ''
            }
        }
    }
}
