require'vscode'.load()

-- light or dark
vim.o.background = 'dark'
require('vscode.colors').get_colors()

require('vscode').setup {
  transparent = true,
  float = { transparent = true },
  italic_comments = true,
}

require'telescope'.setup {
   pickers = {
      find_files = {
         find_command = {'rg', '--files', '--hidden'},
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
            preview_hieght = 0.90,
         },
      },

   }
}

require'nvim-treesitter.configs'.setup {
  sync_install = true,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}


print("Configuration Loaded")
