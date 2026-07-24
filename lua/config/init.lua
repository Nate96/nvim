-- Transparent brackground as default for any things that support it
local function apply_transparent_bg()
   vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "none" })
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "none" })
   vim.api.nvim_set_hl(0, 'LineNr', { bg = "none", fg = "gray" })
   vim.api.nvim_set_hl(0, 'CursorLine', { bg =3684408})
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


local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
   vim.notify('gitsigns not installed. Run :PackerSync', vim.log.levels.WARN)
else
gitsigns.setup {
   signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
   },
   on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(mode, l, r, desc)
         vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map('n', ']h', gs.next_hunk, 'Next hunk')
      map('n', '[h', gs.prev_hunk, 'Prev hunk')
      map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
      map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
      map('n', '<leader>hb', gs.blame_line, 'Blame line')
      map('n', '<leader>hd', gs.diffthis, 'Diff this')
   end,
}
end

print("Configuration Loaded")
