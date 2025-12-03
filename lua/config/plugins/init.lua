local M = {}

local get_lazy_path = function()
    return vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
end

local require_plugin = function(name)
    return require('config.plugins.' .. name)
end

M.check_install_lazy = function()
    local lazypath = get_lazy_path()
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            'git',
            'clone',
            '--filter=blob:none',
            'https://github.com/folke/lazy.nvim.git',
            '--branch=stable',
            lazypath
        })
    end
end

M.setup = function()
    vim.opt.rtp:prepend(get_lazy_path())

    require('lazy').setup({
        require_plugin('treesitter'),
        require_plugin('kanagawa-colorscheme'),
        require_plugin('lualine'),
        require_plugin('icons'),
        require_plugin('telescope'),
        require_plugin('completion'),
        require_plugin('lsp')
    })
end

return M
