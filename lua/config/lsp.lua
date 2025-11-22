local sign_type = vim.diagnostic.severity

vim.diagnostic.config({
    signs = {
        text = {
            [sign_type.ERROR] = '',
            [sign_type.WARN] = '',
            [sign_type.HINT] = '',
            [sign_type.INFO] = '',
        }
    }
})

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

local on_attach = function(client, bufnr)
    keymaps.lsp_on_attach(client, bufnr)
end

local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes
            })
        end
    }
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

--local lspconfig = require('lspconfig')
--lspconfig.pylsp.setup({
--    on_attach = keymaps.lsp_on_attach,
--    settings = {
--        configurationSources = {"flake8"},
--        formatCommand = {"black"}
--    }
--})
