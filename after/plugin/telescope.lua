require 'telescope'.setup {
   pickers = {
      find_files = {
         find_command = { 'rg', '--files'},
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

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fF', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fH', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>fg', function()
    builtin.find_files({ hidden = true, no_ignore = true, find_command = { 'rg', '--files', '--hidden' } })
end, {})
