local M = {}

function check_backspace()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

function M.setup()
	local ok, cmp = pcall(require, 'nvim-cmp')
	if not ok then
		return
	end
	
	cmp.setup({
		mapping = {
			['<C-k>'] = cmp.mapping.select_prev_item(),
			['<C-j>'] = cmp.mapping.select_next_item(),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, { 'i', 's' }),
			
		},
		formatting = {
			fields = { 'kind', 'abbr', 'menu' },
			format = function(entry, vim_item)
				vim_item.menu = ({
					buffer = '[Buffer]',
					path = '[Path]'
				})[entry.source.name]
				return vim_item
			end,
			sources = {
				{ name = 'buffer' },
				{ name = 'path' }
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false
			},
			window = {
				documentation = cmp.config.window.bordered()
			}
		}
	})
end

return M
