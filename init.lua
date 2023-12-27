require("1")

print("Greatings")

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.expandtab = true

vim.smartindent = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true

vim.opt.scrolloff = 99
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50
vim.opt.colorcolumn = '80'

-- HotKey Changes
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Remape for natvigating windows
vim.keymap.set('n', '<leader>ws', '<C-w>s') -- split veriticly
vim.keymap.set('n', '<leader>wv', '<C-w>v') -- split hosizontally
vim.keymap.set('n', '<leader>wq', '<C-w>q') -- quit window
vim.keymap.set('n', '<leader>wh', '<C-w>H') -- move left
vim.keymap.set('n', '<leader>wj', '<C-w>J') -- move down
vim.keymap.set('n', '<leader>wk', '<C-w>K') -- move up
vim.keymap.set('n', '<leader>wl', '<C-w>L') -- move right
