local M = {}

local servers = {
    lua_ls = {},
    pylsp = {},
    clangd = {},
    csharp_ls = {}
}

local sign_type = vim.diagnostic.severity

local diagnostic_settings = {
    signs = {
        text = {
            [sign_type.ERROR] = '',
            [sign_type.WARN] = '',
            [sign_type.HINT] = '',
            [sign_type.INFO] = ''
        }
    }
}

M.setup = function()
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = require('config.keymaps').setup_lsp_on_attach
    })

    vim.diagnostic.config(diagnostic_settings)

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local lspconfig = require('lspconfig')
    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = false,
        handlers = {
            function(server_name)
                local server = servers[server_name] or {}
                server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                lspconfig[server_name].setup(server)
            end
        }
    })

    vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        once = true,
        callback = function()
            local mason_registry = require('mason-registry')
            if not mason_registry.is_installed('tree-sitter-cli') then
                vim.defer_fn(function()
                    mason_registry.refresh()
                    mason_registry.get_package('tree-sitter-cli'):install()
                end, 100)
            end
        end,
    })
end

return M
