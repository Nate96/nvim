local FORWARD  =  1
local BACKWARD = -1

local function jump(direction)
   local directory = vim.fn.getcwd() .. "/Journal"
   local current_page = vim.api.nvim_buf_get_name(0):match(".*/(%d%d%d%d%-%d%d%-%d%d)")
   local files = vim.fn.readdir(directory)

   for index, file in ipairs(files) do
      if file:match("(%d%d%d%d%-%d%d%-%d%d)") == current_page then
         vim.api.nvim_command("edit " .. directory .. '/' .. files[index + direction])
         break
      end
   end
end

local function jump_to_today()
   local directory = vim.fn.getcwd() .. "/Journal"
   local files = vim.fn.readdir(directory)
   local current_day = os.date("%Y-%m-%d")
   local most_recent_page = files[#files]
   local current_day_of_week = os.date("%A")

   if current_day == most_recent_page then
      vim.api.nvim_command("edit " .. directory .. '/' .. files[#files])
   else
      vim.api.nvim_command("edit " .. directory .. '/' .. current_day .. ' ' .. current_day_of_week .. ".md")
   end
end

vim.keymap.set('n', '<leader>k', function () jump_to_today() end)
vim.keymap.set('n', '<leader>j', function() jump(FORWARD) end)
vim.keymap.set('n', '<leader>l', function() jump(BACKWARD) end)

-- TODO: when Journal directory is not pressent, ask user to create one. 
-- TODO: Add check for first page and last page when jumping FORWARD or BACKWARD
