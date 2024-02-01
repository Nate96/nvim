-- FULL Path to the local.lua file
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

print("Plugins Has Been Loaded")

if (LocalConfigFile ~= nil and LocalConfigFile ~= '') then
    dofile(LocalConfigFile)
end


