return {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = { 'saghen/blink.compat' },
    opts = {
        keymap = require('config.keymaps').completion_keymaps,
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0
            }
        },
        sources = {
            default = { 'lsp', 'path', 'buffer', 'cmdline', 'supermaven' },
            providers = {
                --copilot = {
                --    name = 'copilot',
                --    module = 'blink-copilot',
                --    score_offset = 100,
                --    async = true
                --}
                supermaven = {
                    name = 'supermaven',
                    module = 'blink.compat.source',
                    opts = {},
                    score_offset = 100
                }
            }
        },
        signature = { enabled = true }
    }
}
