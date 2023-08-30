print("Loading Plugins")

require("autoclose").setup()
require('vscode').load()
--/ require('everforest').load()

require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "node_modules" 
    }
  }
}
