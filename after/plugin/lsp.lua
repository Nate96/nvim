require("mason").setup() -- also puts Mason's servers on PATH

-- Completion (lsp-zero used to set this up)
local cmp = require("cmp")
local sel = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
   snippet = { expand = function(a) require("luasnip").lsp_expand(a.body) end },
   mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(sel),
      ["<C-j>"] = cmp.mapping.select_next_item(sel),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
   }),
   sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
})

-- Settings for every server, plus per-server overrides
vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
vim.lsp.config("marksman", { settings = { diagnostics = { disable = { "trailing-space" } } } })

-- Servers you have installed in Mason
vim.lsp.enable({
   "lua_ls", "pyright", "ruff", "marksman", "jsonls", "ts_ls",
   "terraformls", "tflint", "dockerls", "docker_compose_language_service",
   "azure_pipelines_ls",
})

-- Keymaps when a server attaches (replaces lsp.on_attach)
vim.api.nvim_create_autocmd("LspAttach", {
   callback = function(ev)
      local o = { buffer = ev.buf }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, o)
      vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, o)
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, o)
      vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, o)
      vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, o)
      vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, o)
      vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, o)
      vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, o)
      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, o)
   end,
})

local S = vim.diagnostic.severity
vim.diagnostic.config({
   virtual_text = true,
   signs = { text = { [S.ERROR] = "E", [S.WARN] = "W", [S.HINT] = "H", [S.INFO] = "I" } },
})


vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
