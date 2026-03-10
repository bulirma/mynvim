local config = function()
    require('config.keymaps').setup_fzf()
end

return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = config
}
