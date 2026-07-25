vim.cmd('source ~/.vimrc')

print("Welcome", '\n', '\n')

local file_path = "/Users/nbraukhoff/.config/nvim/cover.txt"
local file = io.open(file_path, "r")

if file then
   print(file:read("*all"))
   file:close()
end


-- Sourcing for Vim Plug
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

require("config")
