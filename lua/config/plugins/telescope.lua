local config = function()
    require('config.keymaps').setup_telescope()
end

return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = config
}
