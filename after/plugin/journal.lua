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


local timer = nil
local buf = nil

local function toggle_timer()
    -- 1. If timer is already running, stop it
    if timer then
        timer:stop()
        timer:close()
        timer = nil
        print("Timer Stopped")
        return
    end

    -- 2. Setup buffer if it doesn't exist
    if not buf or not vim.api.nvim_buf_is_valid(buf) then
        buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_command('sb' .. buf) -- Open in a horizontal split
    end

    -- 3. Start the timer
    timer = vim.loop.new_timer()
    local count = 0
    timer:start(0, 1000, vim.schedule_wrap(function()
        count = count + 1
        local msg = "Tick " .. count .. " at " .. os.date("%H:%M:%S")
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, { msg })
    end))
    print("Timer Started")
end

-- FIX: Pass the function name directly or wrap it in a function() block
vim.keymap.set('n', '<leader>t', toggle_timer, { desc = "Toggle buffer timer" })

