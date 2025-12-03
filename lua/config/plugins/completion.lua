return {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    opts = {
        keymap = require('config.keymaps').completion_keymaps
    },
    appearance = {
        nerd_font_variant = 'mono'
    },
    sources = {
        default = { 'lsp', 'path' }
    }
}
