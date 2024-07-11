-- Directions
local FORWARD  =  1
local BACKWARD = -1

local function jump(direction)
   local directory = vim.fn.getcwd() .. "/Journal"
   local current_page = vim.api.nvim_buf_get_name(0):match("(%d%d%d%d%-%d%d%-%d%d)")
   local files = vim.fn.readdir(directory)

   if current_page == nil then
      print("current page name is not in the correct formate")
   else
      for index, file in ipairs(files) do
         if file:match("(%d%d%d%d%-%d%d%-%d%d)") == current_page then
            if index == 1 and direction == BACKWARD then
               print("You are at the first entry cannot jump backwards")
               break
            elseif index == #files and direction == FORWARD then
               print("You are at the last entry cannot jump forward")
               break
            else
               vim.api.nvim_command("edit " .. directory .. '/' .. files[index + direction])
               break
            end
         end
      end
   end
end

local function jump_to_today()
   local current_day = os.date("%Y-%m-%d")
   local directory = vim.fn.getcwd() .. "/Journal"
   local current_day_of_week = os.date("%A")
   local stat = vim.loop.fs_stat(directory)

   if stat and stat.type == "directory" then
      local files = vim.fn.readdir(directory)

      if  #files ~= 0 then
         local current_file_name = vim.api.nvim_buf_get_name(0):match("(%d%d%d%d%-%d%d%-%d%d)")
         local last_file_name  = files[#files]:match("(%d%d%d%d%-%d%d%-%d%d)")

         if current_file_name == last_file_name then 
            -- create buffer with FORMAT: yyyy-mm-dd WEEKDAY
            vim.api.nvim_command("edit " .. directory .. '/' .. current_day .. ' ' .. current_day_of_week .. ".md")
         else 
            -- jump to last entry
            vim.api.nvim_command("edit " .. directory .. '/' .. files[#files])
         end
      end
   else
      local input = vim.fn.input("the Journal Direcory is not create, do you want to create? y/n: ")

      if input == 'y' then
         os.execute("mkdir " .. directory)
         -- FORMAT: yyyy-mm-dd WEEKDAY
         vim.api.nvim_command("edit " .. directory .. '/' .. os.date("%Y-%m-%d") .. ' ' .. os.date("%A") .. ".md")
      end
   end
end

local function clean_journal()
   local directory = vim.fn.getcwd() .. "/Journal/"
   local files = vim.fn.readdir(directory)

   if files == nil then
      print("cannot perform action")
   else
      for _, file in ipairs(files) do
         local f = io.open(directory .. file, "r")
         local file_size = -1

         if f ~= nil then
            file_size = f:seek("end")
            f:close()
         end

         if file_size == 0 then
            print("deleting:", file)
            local success, err = os.remove(directory .. file)
            if success then
               print("success")
            else
               print("Error:" , err)
            end
         elseif file_size == -1 then
            print("err")
         end
      end
   end
end

vim.keymap.set('n', '<leader>k', function () jump_to_today() end)
vim.keymap.set('n', '<leader>j', function() jump(FORWARD) end)
vim.keymap.set('n', '<leader>l', function() jump(BACKWARD) end)
vim.api.nvim_create_user_command("CleanJournal", clean_journal, {})
