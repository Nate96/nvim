require("vscode").load()

require('telescope').setup{
   defaults = {
      file_ignore_patterns = {
         "node_modules",
         ".git"
      },
      -- Custom Layout
      -- Full screen
      -- ratio is 25% 75%
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "bottom",
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.70,}
         },
   }
}
print("Configuration Loaded")
