-- FULL Path to the local.lua file
-- TODO: Add local configuration and have local configs be able to stay when
--      merging master into local
LocalConfigFile = ""

print("Loading Plugins....")

require("autoclose").setup()
require("vscode").load()
require("packer")

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git"
    }
  }
}

require('neorg').setup {
  load = {
    ["core.defaults"] = {},  -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.dirman"] = {      -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
      },
    },
  },
}

print("Plugins Has Been Loaded")

if (LocalConfigFile ~= nil and LocalConfigFile ~= '') then
    dofile(LocalConfigFile)
end
