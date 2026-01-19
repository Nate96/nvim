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
local log_buf = nil

local function toggle_vertical_timer()
    -- 1. Stop if running
    if timer then
        timer:stop()
        timer:close()
        timer = nil
        print("Timer Stopped")
        return
    end

    -- 2. Create buffer if it doesn't exist or isn't valid
    if not log_buf or not vim.api.nvim_buf_is_valid(log_buf) then
        log_buf = vim.api.nvim_create_buf(false, true) -- (listed=false, scratch=true)
        vim.api.nvim_buf_set_name(log_buf, "Timer_Log")
    end

    -- 3. Open in a vertical split
    -- 'vsplit' opens a new window; 'b' then loads our buffer into it
    vim.cmd('vsplit')
    vim.api.nvim_win_set_buf(0, log_buf)

    -- 4. Start the timer
    timer = vim.loop.new_timer()
    local count = 0

    timer:start(0, 1000, vim.schedule_wrap(function()
        if not vim.api.nvim_buf_is_valid(log_buf) then return end

        count = count + 1
        local msg = string.format("[%d] %s", count, os.date("%H:%M:%S"))

        -- Append line to the end
        vim.api.nvim_buf_set_lines(log_buf, -1, -1, false, { msg })

        -- Auto-scroll to the bottom of the window
        local win = vim.fn.bufwinid(log_buf)
        if win ~= -1 then
            local line_count = vim.api.nvim_buf_line_count(log_buf)
            vim.api.nvim_win_set_cursor(win, { line_count, 0 })
        end
    end))

    print("Timer Started in Vertical Split")
end

-- Keymap to trigger
vim.keymap.set('n', '<leader>t', toggle_vertical_timer, { desc = "Toggle vertical timer log" })
