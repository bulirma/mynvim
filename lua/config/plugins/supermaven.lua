return {
    'supermaven-inc/supermaven-nvim',
    cond = vim.g.use_ai_plugins,
    config = function()
        require('supermaven-nvim').setup({
            disable_inline_completion = true
        })
    end
}
