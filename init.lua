vim.cmd('source ~/.vimrc')

print("Welcome", '\n', '\n')

local file_path = "/Users/nbraukhoff/.config/nvim/cover.txt"
local file = io.open(file_path, "r")

if file then
   print(file:read("*all"))
   file:close()
end

-- Auto read file when changed outside of vim and when `fg`
vim.opt.autoread = true
vim.api.nvim_create_autocmd("VimResume", {
   pattern = "*",
   command = "checktime",
})

-- Sourcing for Vim Plug
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

require("config")
