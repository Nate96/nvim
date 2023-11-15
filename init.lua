require("1")

print("Greatings")

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.expandtab = true

vim.smartindent = true

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3

vim.opt.termguicolors = true

vim.opt.scrolloff = 99 
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = '80'

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
