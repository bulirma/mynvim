local prefix = 'mynvim.'

local modules = {
	'options',
	'keymaps',
	'plugins',
	'colorscheme'
}

for i = 1, #modules do
	local mod_name = modules[i]
	local module, ok = pcall(require, prefix .. mod_name)
	if not ok then
		vim.notify('Module ' .. mod_name .. ' not found!')
	end
end
