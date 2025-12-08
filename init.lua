print("Welcome", '\n', '\n')

local file_path = "./cover.txt"
local file = io.open(file_path, "r")

if file then
    print(file:read("*all"))
    file:close()
 end

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.expandtab = true

vim.smartindent = true

vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3

vim.opt.termguicolors = true

vim.opt.wrap = false

vim.opt.scrolloff = 99
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50
vim.opt.colorcolumn = '120'
vim.opt.cursorline = true

-- Blinking Curser
vim.opt.guicursor = 'n-v-c:block-blinkwait700-blinkoff400-blinkon250,i:ver25-blinkwait700-blinkoff400-blinkon250'

--============================= KEYBINDINGS ===================================
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader><leader>', vim.cmd.Ex)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Paging up and down
vim.keymap.set({'n', 'v', 's', 'o'}, '<C-j>', '<C-d>') -- half down 
vim.keymap.set({'n', 'v', 's', 'o'}, '<C-k>', '<C-u>') -- half up

-- navigating windows
vim.keymap.set('n', '<leader>ws', '<C-w>s') -- split vertically
vim.keymap.set('n', '<leader>wv', '<C-w>v') -- split horizontally
vim.keymap.set('n', '<leader>wq', '<C-w>q') -- quit window
vim.keymap.set('n', '<leader>wh', '<C-w>h') -- move left
vim.keymap.set('n', '<leader>wj', '<C-w>j') -- move down
vim.keymap.set('n', '<leader>wk', '<C-w>k') -- move up
vim.keymap.set('n', '<leader>wl', '<C-w>l') -- move right

-- resizing windows
vim.keymap.set('n', '<leader>w,', '10<C-w><') -- Decrease pane width by 10
vim.keymap.set('n', '<leader>w.', '10<C-w>>') -- Increase pane width by 10
vim.keymap.set('n', '<leader>w+', '5<C-w>+')  -- Increase pane hight by 5
vim.keymap.set('n', '<leader>w_', '5<C-w>-')  -- Decrease pane hight by 5

-- windows block mode
vim.keymap.set('n', '<leader>v', '<C-v>')

-- yanking text to system
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')

-- Toggling Spell Checker
vim.api.nvim_set_keymap('n', '<leader>s', ':set spell!<CR>', { noremap = true, silent = true })

-- remove highlight
vim.keymap.set('n', '<ESC>', ':nohl<CR>')

-- terminal mode escape
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
--============================================================================= 

require("config")
require("plugins")

-- Sourcing for Vim Plug
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
