local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' }
}

for _, sign in pairs(signs) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = ''
    })
end

require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
    lua_ls = {
        Lua = {
            telemetry = { enable = false }
        }
    }
}

local keymaps = require('config.keymaps')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers)
})
mason_lspconfig.setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = keymaps.lsp_on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes
        })
    end
})

local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup({})

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert({
        [keymaps.cmp_keys.prev_item] = cmp.mapping.select_prev_item(),
        [keymaps.cmp_keys.next_item] = cmp.mapping.select_next_item(),
        [keymaps.cmp_keys.scroll_up_doc] = cmp.mapping.scroll_docs(-4),
        [keymaps.cmp_keys.scroll_down_doc] = cmp.mapping.scroll_docs(4),
        [keymaps.cmp_keys.complete] = cmp.mapping.complete({}),
        [keymaps.cmp_keys.confirm] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        [keymaps.cmp_keys.snip_jmp] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        [keymaps.cmp_keys.snip_jmp_rev] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' })
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }
})

local lspconfig = require('lspconfig')
lspconfig.pylsp.setup({
    on_attach = keymaps.lsp_on_attach,
    settings = {
        configurationSources = {"flake8"},
        formatCommand = {"black"},
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = {
                        'E112', -- indented comment
                        'E115', -- indented comment
                        'E128', -- continuation
                        'E201', -- whitespace after ']'
                        'E202', -- whitespace before ']'
                        'E226', -- no whitespaces between opeators
                        'E231',
                        'E265', -- comments should have a space after '#'
                        'E301', -- blank lines around functions/classes
                        'E302',
                        'E303',
                        'E305',
                        'E402', -- module level import not on the top
                        'E501', -- line too long
                        'W291', -- trailing whitespace
                        'W293', -- blank line contains whitespaces
                        'W391'  -- blank line at end of the file
                    }
                    --maxLineLength = 120
                },
            }
        }
    }
})
