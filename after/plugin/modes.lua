vim.keymap.set("n", "<leader>md", function()
   vim.wo.relativenumber = true
   vim.opt.scrolloff = 99
end)

vim.keymap.set("n", "<leader>mp", function()
   vim.wo.relativenumber = false
   vim.opt.scrolloff = 0
end)

vim.keymap.set("n", "<leader>n7", function ()
   local bufnr = vim.api.nvim_get_current_buf()
   local total_lines = vim.api.nvim_buf_line_count(bufnr)
   local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]

   -- Append the first line to the bottom of the buffer
   vim.api.nvim_buf_set_lines(bufnr, total_lines, total_lines, false, { first_line })
   -- Delete the first line
   vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, {})
end)

---- Function to move the first line to the bottom and shift all lines up
--local function move_first_line_to_bottom()
--  -- Get the current buffer
--  local bufnr = vim.api.nvim_get_current_buf()
--
--  -- Get the first line of the buffer
--  local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
--
--  -- Get the total number of lines in the buffer
--  local total_lines = vim.api.nvim_buf_line_count(bufnr)
--
--  -- Append the first line to the bottom of the buffer
--  vim.api.nvim_buf_set_lines(bufnr, total_lines, total_lines, false, { first_line })
--
--  -- Delete the first line
--  vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, {})
--end
--
---- Map <leader>n7 to execute the function
--vim.api.nvim_set_keymap('n', '<leader>n7', '<cmd>lua move_first_line_to_bottom()<CR>', { noremap = true, silent = true })
