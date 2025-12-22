function NoBackGround()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = "none", fg = "gray" })
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = "none", underline = true, sp = "gray" })
  vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = "none", fg = "white", bold = true })
end

function SetOpaqueTheme()
  vim.cmd.colorscheme("vscode")
end

function ResetTheme()
   SetOpaqueTheme()
   NoBackGround()
end

vim.cmd('command! NoBackground lua NoBackground()')
vim.cmd('command! Background   lua SetOpaqueTheme()')
vim.cmd('command! ResetTheme   lua ResetTheme()')

-- Make it transparent by default
NoBackGround()
