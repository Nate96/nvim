require 'telescope'.setup {
   pickers = {
      find_files = {
         find_command = { 'rg', '--files' },
      },
      buffers = {
         mappings = {
            i = { ['<M-d>'] = require('telescope.actions').delete_buffer },
            n = { ['dd'] = require('telescope.actions').delete_buffer },
         },
      },
      live_grep = {
         additional_args = function()
            return { "--hidden" }
         end
      },
   },
   defaults = {
      mappings = {
         i = {
            ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
            ['<C-d>'] = require('telescope.actions').to_fuzzy_refine
         },
         n = {
            ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
            ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
            ['<C-d>'] = require('telescope.actions').to_fuzzy_refine
         }
      },
      preview = {
         hide_on_startup = true -- hide previewer when picker starts
      },
      file_ignore_patterns = {
         "node_modules",
      },
      sorting_strategy = "ascending",
      layout_strategy = "flex",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.65,
         },
         vertical = {
            prompt_position = "top",
         },
      },

   }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f.', builtin.find_files, {})
vim.keymap.set('n', '<leader>g.', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>H', builtin.help_tags, {})
vim.keymap.set('n', '<leader>t', builtin.resume, {})
vim.keymap.set('n', '<leader>fg', builtin.git_status, {})
vim.keymap.set('n', '<leader>fh', function()
   builtin.find_files(
      {
         prompt_title = "+ hidden files",
         hidden = true,
         no_ignore = true,
         find_command = { 'rg', '--files', '--hidden' }
      })
end)

vim.keymap.set('n', '<leader>gh', function()
   builtin.live_grep({
      prompt_title = "+ grep hidden/ignored",
      additional_args = { "--hidden", "--no-ignore", "--glob", "!.git/" },
   })
end, { desc = "Grep incl. hidden + ignored" })

-- <leader>fd / <leader>gd: find / grep in the current buffer's dir and below.
local function buffer_dir()
   local dir = vim.fn.expand("%:p:h")
   if dir == "" or vim.fn.isdirectory(dir) == 0 then dir = vim.fn.getcwd() end
   return dir
end

vim.keymap.set('n', '<leader>fd', function()
   local dir = buffer_dir()
   builtin.find_files({ cwd = dir, prompt_title = "+ " .. vim.fn.fnamemodify(dir, ":~") })
end, { desc = "Find files in buffer dir" })

vim.keymap.set('n', '<leader>gd', function()
   local dir = buffer_dir()
   builtin.live_grep({ cwd = dir, prompt_title = "+ grep " .. vim.fn.fnamemodify(dir, ":~") })
end, { desc = "Grep buffer dir" })
