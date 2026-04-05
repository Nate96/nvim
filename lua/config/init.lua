-- Transparent brackground as default for any things that support it
local function apply_transparent_bg()
   vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "none" })
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "none" })
   vim.api.nvim_set_hl(0, 'LineNr', { bg = "none", fg = "gray" })
   --vim.api.nvim_set_hl(0, 'CursorLine', { bg = "none", underline = true, sp = "gray" })
   vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = "none", fg = "white", bold = true })

   vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "none", bg = "none" })
   vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "none", bg = "none" })
   vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "none", bg = "none" })
   vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "none", bg = "none" })
end

apply_transparent_bg()
vim.api.nvim_create_autocmd("ColorScheme", {
   pattern = "*",
   callback = apply_transparent_bg,
})

--

require 'vscode'.load()
require('vscode.colors').get_colors()

require('vscode').setup {
   transparent = true,
   float = { transparent = true },
   italic_comments = true,
}

require 'nvim-treesitter.configs'.setup {
   sync_install = true,
   auto_install = true,

   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },
}


print("Configuration Loaded")
