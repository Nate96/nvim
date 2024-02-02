print("Welcome", '\n', '\n')

print("       / <     >\\")
print("      / /      \\ \\")
print("     ( (_______) )")
print("      |         |")
print("      |  _   _  |")
print("      | / \\ / \\ |")
print("      : \\_/ \\_/ ;")
print("       \\_______/")
print("(~~~~~~~ / /  \\ ~~~~~~~~)")
print("|~~~~~~~|/  /\\ |~~~~~~~~|")
print("|~~~~~~~|  /\\ \\|~~~~~~~~|")
print("//      |//  \\ |       \\\\")
print("---------||-||----------")
print("||]       v   v       [||")
print("||                     || ",'\n', '\n')

-- TODO: Delete extra lines
-- TODO: call modes files to set dev mode 

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

-- Remap for navigating windows
vim.keymap.set('n', '<leader>ws', '<C-w>s') -- split vertically
vim.keymap.set('n', '<leader>wv', '<C-w>v') -- split horizontally
vim.keymap.set('n', '<leader>wq', '<C-w>q') -- quit window
vim.keymap.set('n', '<leader>wh', '<C-w>h') -- move left
vim.keymap.set('n', '<leader>wj', '<C-w>j') -- move down
vim.keymap.set('n', '<leader>wk', '<C-w>k') -- move up
vim.keymap.set('n', '<leader>wl', '<C-w>l') -- move right

-- Toggling Spell Checker 
vim.api.nvim_set_keymap('n', '<leader>s', ':set spell!<CR>', { noremap = true, silent = true })

require("1")
