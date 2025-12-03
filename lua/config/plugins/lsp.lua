local config = function()
    require('config.lsp').setup()
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'mason-org/mason.nvim',
        'mason-org/mason-lspconfig.nvim',
        'saghen/blink.cmp'
    },
    config = config
}
