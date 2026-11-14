vim.cmd.source(vim.fn.stdpath("config") .. "/.vimrc")
vim.cmd('source ~/.vimrc')

print("Welcome", '\n', '\n')
local file = io.open(vim.fn.stdpath("config") .. "/cover.txt" , "r")

if file then
   print(file:read("*all"))
   file:close()
end

-- Sourcing for Vim Plug
vim.cmd.source(vim.fn.stdpath("config") .. "/vimrc.vim")

require("config")

-- TODO: Convert to Vimplug
-- TODO: Research lazy git and how to change that
