vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local M = {}

local options = {
    -- behavior
    autochdir = false,
    backup = false,
	encoding = 'utf-8',
    errorbells = false,
    hidden = false,
    splitbelow = true,
    splitright = true,
	swapfile = false,

    -- indentation
	expandtab = true,
	shiftwidth = 4,
	smartindent = true,
	softtabstop = 4,
	tabstop = 4,
    wrap = true, -- break long lines
    
    -- search
    incsearch = true,
    ignorecase = false,
    smartcase = true,
    hlsearch = true,

    -- appearance
    cmdheight = 1,
    completeopt = 'menuone,noinsert,noselect',
	number = true,
	relativenumber = true,
	scrolloff = 8,
    signcolumn = 'yes',
	syntax = 'on',
	termguicolors = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

return M
