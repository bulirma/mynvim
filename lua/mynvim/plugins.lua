local M = {}

local fn = vim.fn

function M.setup()
	-- install packer if it is not already done
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		PACKER_BOOTSTRAP = fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path
		})
		print('Installing neovim packer...')
		vim.cmd([[packadd packer.nvim]])
	end
	
	-- sync packer whenever this file is updated
	vim.cmd [[
	  augroup packer_user_config
	    autocmd!
	    autocmd BufWritePost plugins.lua source <afile> | PackerSync
	  augroup end
	]]

	-- safely load packer
	local ok, packer = pcall(require, 'packer')
	if not ok then
		return M
	end

	-- init packer
	packer.init({
		display = {
			open_fn = function()
				return require('packer.util').float()
			end
		}
	})

	-- use plugins
	packer.startup(function(use)
		use('wbthomason/packer.nvim')
		use('nvim-lua/popup.nvim')
		use('nvim-lua/plenary.nvim')

		if PACKER_BOOTSTRAP then
			require('packer').sync()
		end
	end)
end

return M
