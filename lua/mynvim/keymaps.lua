local M = {}

local opts = {
	noremap = true,
	silent = true
}

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

function M.setup()
	keymap('', '<Space>', '<Nop>', opts)
	vim.g.mapleader = ' '
	vim.g.maplocalleader = ' '

	keymap('t', '<C-e>', '<C-\\><C-n>', term_opts)

	-- tabs
	keymap('n', '<Leader>tn', ':tabnew<CR>', opts)
	keymap('n', '<Leader>k', ':tabp<CR>', opts)
	keymap('n', '<Leader>j', ':tabn<CR>', opts)

	-- telescope
	keymap('n', '<C-f>', ':Telescope find_files<CR>', opts)

	-- window navigation
	keymap('n', '<C-h>', '<C-w>h', opts)
	keymap('n', '<C-j>', '<C-w>j', opts)
	keymap('n', '<C-k>', '<C-w>k', opts)
	keymap('n', '<C-l>', '<C-w>l', opts)

	keymap('n', '<Leader>e', ':Lexplore 24<CR>', opts)
	keymap('n', '<Leader>t', ':terminal<CR>', opts)

	-- clipboard
	keymap('v', '<C-y>', '"+y', opts)
	keymap('n', '<C-p>', '"+p', opts)

end

return M
