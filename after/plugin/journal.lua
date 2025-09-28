local J = require("journal")

vim.keymap.set('n', '<leader>k', function () J.jump_to_today() end)
vim.keymap.set('n', '<leader>l', function() J.jump_forward() end)
vim.keymap.set('n', '<leader>j', function() J.jump_backward() end)
vim.keymap.set('n', '<leader>m', function () J.jump_to_log_type() end)

vim.api.nvim_create_user_command("CleanJournal", function() J.clean_journal() end, {})
vim.api.nvim_create_user_command("Today", function() J.jump_to_today() end, {})

function InsertTimestamp()
    local timestamp = os.date("%A %Y-%m-%d %I:%M %p")
    vim.api.nvim_put({timestamp}, 'c', true, true)
end

vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua InsertTimestamp()<CR>', { noremap = true, silent = true })
