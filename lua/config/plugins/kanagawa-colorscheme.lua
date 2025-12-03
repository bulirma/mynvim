local config = function()
    vim.cmd.colorscheme('kanagawa-dragon')
end

return {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = config
}
