local M = {}

local kmap = vim.keymap.set
local nmap_nrsil = function(shortcut, op)
    kmap('n', shortcut, op, { noremap = true, silent = true })
end
local vmap_nrsil = function(shortcut, op)
    kmap('v', shortcut, op, { noremap = true, silent = true })
end
local nmap_exsil = function(shortcut, op)
    kmap('n', shortcut, op, { expr = true, silent = true })
end


M.setup = function()
    kmap({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

    nmap_exsil('j', "v:count == 0 ? 'gj' : 'j'")
    nmap_exsil('k', "v:count == 0 ? 'gk' : 'k'")

    nmap_nrsil('<leader>t', ':tabnew<CR>')
    nmap_nrsil('<leader>h', ':tabp<CR>')
    nmap_nrsil('<leader>l', ':tabn<CR>')
    nmap_nrsil('<leader>q', ':bd<CR>')
    nmap_nrsil('<leader>d', vim.diagnostic.open_float)
    nmap_nrsil('<c-h>', '<c-w>h')
    nmap_nrsil('<c-j>', '<c-w>j')
    nmap_nrsil('<c-k>', '<c-w>k')
    nmap_nrsil('<c-l>', '<c-w>l')

    kmap({ 'n', 'v' }, '<leader>y', '"+y', {  noremap = true, silent = true })
    nmap_nrsil('<leader>p', '"+p')
    nmap_nrsil('<leader>P', '"+P')

    vmap_nrsil('<', '<gv')
    vmap_nrsil('>', '>gv')
    vmap_nrsil('J', '>+1<cr>gv=gv')
    vmap_nrsil('K', '<-2<cr>gv=gv')
end

M.setup_telescope = function()
    local builtin = require('telescope.builtin')

    nmap_nrsil('<leader>ff', builtin.find_files)
    nmap_nrsil('<leader>fg', builtin.live_grep)
    nmap_nrsil('<leader>ft', builtin.filetypes)
    nmap_nrsil('<leader>fb', builtin.buffers)
    nmap_nrsil('<leader>fd', builtin.diagnostics)
end

M.setup_lsp_on_attach = function(event)
    local builtin = require('telescope.builtin')

    local nmap = function(shortcut, op)
        kmap('n', shortcut, op, { buffer = event.buf })
    end

    nmap('<leader>sr', builtin.lsp_references)
    nmap('<leader>si', builtin.lsp_implementations)
    nmap('<leader>sd', builtin.lsp_implementations)
    nmap('<leader>sl', builtin.lsp_implementations)
end

M.completion_keymaps = {
    preset = 'default',
    ['<c-k>'] = { 'select_prev', 'fallback' },
    ['<c-j>'] = { 'select_next', 'fallback' },
    ['<cr>'] =  { 'accept', 'fallback' }
}

return M
