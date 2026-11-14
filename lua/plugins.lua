-- Plugins are managed by vim.pack (built in, Neovim 0.12+).
-- Update: :lua vim.pack.update()   Versions are pinned in nvim-pack-lock.json.
local gh = function(x) return "https://github.com/" .. x end

-- Rebuild treesitter parsers after nvim-treesitter is installed or updated.
vim.api.nvim_create_autocmd("PackChanged", {
   callback = function(ev)
      local name, kind = ev.data.spec.name, ev.data.kind
      if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
         if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
         vim.cmd("TSUpdate")
      end
   end,
})

vim.pack.add({
   -- my plugins
   gh("Nate96/journal.nvim"),

   -- vs code theme
   gh("Mofiqul/vscode.nvim"),
   -- `master` is the frozen branch that still has nvim-treesitter.configs
   { src = gh("nvim-treesitter/nvim-treesitter"), version = "master" },

   -- Navigating files faster
   gh("ThePrimeagen/harpoon"),

   -- the best undoing system ever.
   gh("mbbill/undotree"),
   gh("tpope/vim-fugitive"),

   -- searching through projects
   { src = gh("nvim-telescope/telescope.nvim"), version = "0.1.8" },
   gh("nvim-lua/plenary.nvim"),

   -- Lsp
   gh("neovim/nvim-lspconfig"),
   gh("williamboman/mason.nvim"),
   gh("hrsh7th/nvim-cmp"),
   gh("hrsh7th/cmp-nvim-lsp"),
   gh("L3MON4D3/LuaSnip"),

   -- Note Books
   gh("Vigemus/iron.nvim"),
   gh("tjdevries/present.nvim"),

   -- Git diff viewer and gutter signs
   gh("esmuellert/codediff.nvim"),
   gh("lewis6991/gitsigns.nvim"),

   -- Themes
   { src = gh("catppuccin/nvim"), name = "catppuccin" },
   { src = "https://codeberg.org/evergarden/nvim.git", name = "evergarden" },
   gh("projekt0n/github-nvim-theme"),
   { src = gh("bluz71/vim-moonfly-colors"), name = "moonfly" },

   -- Data
   gh("hat0uma/csvview.nvim"),
   gh("tpope/vim-dadbod"),
   gh("kristijanhusak/vim-dadbod-ui"),
   gh("kristijanhusak/vim-dadbod-completion"),
   gh("mtdl9/vim-log-highlighting"),
})

require("csvview").setup()
