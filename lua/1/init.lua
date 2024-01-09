-- FULL Path to the local.lua file
LocalConfigFile = "C:/Users/nbraukhoff/AppData/Local/nvim/lua/1/local.lua"

if (LocalConfigFile ~= nil and LocalConfigFile ~= '') then
    dofile(LocalConfigFile)
end

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

