vim.cmd.source(vim.fn.stdpath("config") .. "/.vimrc")
vim.cmd('source ~/.vimrc')

print("Welcome", '\n', '\n')
local file = io.open(vim.fn.stdpath("config") .. "/cover.txt" , "r")

if file then
   print(file:read("*all"))
   file:close()
end

require("config")
