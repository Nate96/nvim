require("1")

print("Greatings", '\n')
print(" --------------------")
print("{ That's pretty Neat! }")
print(" --------------------")
print(".")
print(" .")
print("  - >()_")
print("     (__)__ _")

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.expandtab = true

vim.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.termguicolors = true

vim.opt.scrolloff = 99
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50
vim.opt.colorcolumn = '90'

-- HotKey Changes
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Remape for natvigating windows
vim.keymap.set('n', '<leader>ws', '<C-w>s') -- split veriticly
vim.keymap.set('n', '<leader>wv', '<C-w>v') -- split hosizontally
vim.keymap.set('n', '<leader>wq', '<C-w>q') -- quit window
vim.keymap.set('n', '<leader>wh', '<C-w>h') -- move left
vim.keymap.set('n', '<leader>wj', '<C-w>j') -- move down
vim.keymap.set('n', '<leader>wk', '<C-w>k') -- move up
vim.keymap.set('n', '<leader>wl', '<C-w>l') -- move right
