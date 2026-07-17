local config = function()
    require('config.keymaps').setup_fzf()
    require('fzf-lua').setup({
        winopts = {
            preview = {
                layout = 'horizontal'
            }
        }
    })
end

return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = config
}
