vim.keymap.set("n", "<leader>md", function()
   vim.wo.relativenumber = true
   vim.opt.scrolloff = 99
end)

vim.keymap.set("n", "<leader>mp", function()
   vim.wo.relativenumber = false
   vim.opt.scrolloff = 0
end)
