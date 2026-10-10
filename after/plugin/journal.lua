local J = require("journal")

vim.keymap.set('n', '<leader>h', function () J.jump_to_today() end)
vim.keymap.set('n', '<leader>j', function() J.jump_forward() end)
vim.keymap.set('n', '<leader>k', function() J.jump_backward() end)
vim.keymap.set('n', '<leader>m', function () J.jump_to_log_type() end)

vim.api.nvim_create_user_command("CleanJournal", function() J.clean_journal() end, {})
vim.api.nvim_create_user_command("Today", function() J.jump_to_today() end, {})

function InsertTimestamp()
    local timestamp = os.date("[[%Y-%m-%d %A]]")
    vim.api.nvim_put({timestamp}, 'c', true, true)
end

-- wrap at 80
vim.keymap.set("n", "<leader>mw",
  ":%!prettier --prose-wrap always --print-width 80 --parser markdown<CR>")
-- unwrap to one line
vim.keymap.set("n", "<leader>mu",
  ":%!prettier --prose-wrap never --parser markdown<CR>")
