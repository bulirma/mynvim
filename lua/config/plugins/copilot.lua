return {
    'zbirenbaum/copilot.lua',
    cond = vim.g.use_ai_plugins,
    cmd = 'Copilot',
    event = 'VimEnter',
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            help = true
        }
    }
}
