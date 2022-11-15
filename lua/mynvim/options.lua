local options = {
	syntax = 'on',
	encoding = 'utf-8',
	number = true,
	relativenumber = true,
	smartindent = true,
	termguicolors = true,
	swapfile = false
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
