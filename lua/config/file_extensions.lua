vim.cmd([[
    augroup FileTypeSettings
        autocmd!
        autocmd BufNewFile,BufRead *.pl setfiletype prolog
    augroup END
]])
