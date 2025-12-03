local M = {}

M.setup = function()
    require('config.options').setup()
    require('config.keymaps').setup()
    local plugins = require('config.plugins')
    --plugins.check_install_lazy()
    plugins.setup()
end

return M
