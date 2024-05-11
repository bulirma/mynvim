local kmap = vim.keymap.set
local nrmp_sil = {
	noremap = true,
	silent = true
}
local expr_sil = {
	expr = true,
	silent = true
}

kmap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
kmap('n', 'k', "v:count == 0 ? 'gk' : 'k'", expr_sil)
kmap('n', 'j', "v:count == 0 ? 'gj' : 'j'", expr_sil)
kmap('n', '<leader>t', ':tabnew<CR>', nrmp_sil)
kmap('n', '<leader>k', ':tabp<CR>', nrmp_sil)
kmap('n', '<leader>j', ':tabn<CR>', nrmp_sil)
kmap('n', '<leader>q', ':bd<CR>', nrmp_sil)
kmap({ 'n', 'v' }, '<leader>y', '"+y', nrmp_sil)
kmap('n', '<leader>p', '"+p', nrmp_sil)
kmap('n', '<leader>P', '"+P', nrmp_sil)
kmap('v', '<', '<gv', nrmp_sil)
kmap('v', '>', '>gv', nrmp_sil)
kmap('v', 'J', ":m '>+1<CR>gv=gv", nrmp_sil)
kmap('v', 'K', ":m '<-2<CR>gv=gv", nrmp_sil)
kmap('n', '<C-h>', '<C-w>h', nrmp_sil)
kmap('n', '<C-j>', '<C-w>j', nrmp_sil)
kmap('n', '<C-k>', '<C-w>k', nrmp_sil)
kmap('n', '<C-l>', '<C-w>l', nrmp_sil)

local M = {}

M.setup_nvim_tree = function()
    kmap('n', '<leader>e', ':NvimTreeToggle<CR>', nrmp_sil)
end

M.setup_telescope = function(telescope_builtin)
    kmap('n', '<leader>fb', telescope_builtin.buffers, nrmp_sil)
    kmap('n', '<leader>ff', telescope_builtin.find_files, nrmp_sil)
    kmap('n', '<leader>fg', telescope_builtin.live_grep, nrmp_sil)
    kmap('n', '<leader>ft', telescope_builtin.filetypes, nrmp_sil)
end

M.lsp_on_attach = function(_, bufnr)
    local nmap = function(shortcut, cmd)
        kmap('n', shortcut, cmd, { buffer = bufnr })
    end
    nmap('K', vim.lsp.buf.hover)
    nmap('<C-k>', vim.lsp.buf.signature_help)
    nmap('gd', vim.lsp.buf.definition)
    nmap('gD', vim.lsp.buf.declaration)
    nmap('gr', vim.lsp.buf.references)
end

M.cmp_keys = {
    prev_item = '<C-k>',
    next_item = '<C-j>',
    scroll_up_doc = '<C-d>',
    scroll_down_doc = '<C-f>',
    complete = '<C-Space>',
    confirm = '<CR>',
    snip_jmp = '<Tab>',
    snip_jmp_rev = '<S-Tab>'
}

M.setup_dap = function()
    kmap('n', '<F5>', ':lua require("dap").continue()<CR>', { silent = true })
    kmap('n', '<F10>', ':lua require("dap").step_over()<CR>', { silent = true })
    kmap('n', '<F11>', ':lua require("dap").step_into()<CR>', { silent = true })
    kmap('n', '<F12>', ':lua require("dap").step_out()<CR>', { silent = true })
    kmap('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<CR>', { silent = true })
end

return M
