require'vscode'.load()

vim.o.background = 'dark'
--vim.o.background = 'light'

local c = require('vscode.colors').get_colors()
require('vscode').setup {
  transparent = true,
  italic_comments = true,

  -- Override colors (see ./lua/vscode/colors.lua)
  color_overrides = {
    vscLineNumber = '#FFFFFF',
  },

  -- Override highlight groups (see ./lua/vscode/theme.lua)
  group_overrides = {
    -- this supports the same val table as vim.api.nvim_set_hl
    -- use colors from this colorscheme by requiring vscode.colors!
    Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
  }
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
      file_ignore_patterns = {
         "node_modules",
      },
      layout_strategy = "flex",
      -- Custom Layout
      -- Full screen
      -- ratio is 25% 75%
      -- layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "bottom",
            preview_width = 0.40,
         },
         vertical = {
            prompt_position = "bottom",
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
