print("Welcome", '\n', '\n')

local file_path = "/Users/nbraukhoff/.config/nvim/cover.txt"
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

-- cursor fixed in center
-- vim.opt.scrolloff = 99
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50
vim.opt.colorcolumn = '100'
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

-- Optional: Map it for Insert and Visual modes as well
vim.keymap.set({ 'n', 'i', 'v' }, '<C-z>', '<Esc>:wa! | sus <CR>', { desc = 'Save all buffers' })

vim.keymap.set('n', '<C-\\>', '<C-w>v') -- split vertically

-- resizing windows
vim.keymap.set('n', '<C-w><', '10<C-w><') -- Decrease pane width by 10
vim.keymap.set('n', '<C-w>>', '10<C-w>>') -- Increase pane width by 10
vim.keymap.set('n', '<C-w>+', '5<C-w>+')  -- Increase pane hight by 5
vim.keymap.set('n', '<C-w>-', '5<C-w>-')  -- Decrease pane hight by 5

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

-- Leader + z suspends
vim.keymap.set('n', '<leader>z', ':sus<CR>', { desc = 'Suspend Neovim' })
--============================================================================= 

require("config")
require("plugins")

-- Sourcing for Vim Plug
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Transparent background
-- require("catppuccin").setup({
--     transparent_background = true,
--     float = { transparent = true },
-- })
-- 
-- require("everforest").setup({
--     transparent_background = true,
--     float = { transparent = true },
-- })

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, 'LineNr', { bg = "none", fg = "gray" })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = "none", underline = true, sp = "gray" })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = "none", fg = "white", bold = true })


vim.cmd.colorscheme("vscode")
