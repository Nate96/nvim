call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'sainnhe/everforest'

Plug 'hat0uma/csvview.nvim'

call plug#end()

lua require('csvview').setup()
