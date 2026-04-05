require 'telescope'.setup {
   pickers = {
      find_files = {
         find_command = { 'rg', '--files', '--hidden' },
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
            ['<C-p>'] = require('telescope.actions.layout').toggle_preview
         },
         n = {
            ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
            ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
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
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})

vim.keymap.set('n', '<leader>fgit', builtin.git_files, {})

vim.keymap.set('n', '<leader>fs', function()
   local input_string = vim.fn.input("Search For > ")
   if (input_string == '') then
      return
   end
   require("telescope.builtin").grep_string({
      search = input_string
   })
end)

vim.keymap.set('n', '<leader>fd', function()
   builtin.find_files({ cwd = utils.buffer_dir() })
end)
