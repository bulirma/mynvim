return {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
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
            default = { 'lsp', 'path', 'buffer', 'cmdline' }
        },
        signature = { enabled = true }
    }
}
