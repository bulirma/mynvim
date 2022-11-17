local M = {}

local options = {
	syntax = 'on',
	encoding = 'utf-8',
	number = true,
	relativenumber = true,
	cursorline = true,
	smartindent = true,
	termguicolors = true,
	swapfile = false
}

function M.setup()
	for k, v in pairs(options) do
		vim.opt[k] = v
	end
	vim.cmd('colorscheme lunaperche')
end

return M
