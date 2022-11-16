local M = {}

local prefix = 'mynvim.'

local modules = {
	'options',
	'keymaps',
	'plugins',
	'colorscheme'
}

function M.run()
	for i = 1, #modules do
		local mod_name = modules[i]
		local ok, module = pcall(require, prefix .. mod_name)
		if not ok then
			vim.notify('Module ' .. mod_name .. ' not found!')
		else
			module.setup()
		end
	end
end

return M
