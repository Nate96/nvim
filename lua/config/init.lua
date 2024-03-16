-- FULL Path to the local.lua file
-- TODO: Add local configuration and have local configs be able to stay when
--      merging master into local
LocalConfigFile = ""

print("Loading Plugins....")

require("vscode").load()
require("packer")
require("obsidian")

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git"
    }
  }
}

print("Plugins Has Been Loaded")

if (LocalConfigFile ~= nil and LocalConfigFile ~= '') then
    dofile(LocalConfigFile)
end
