call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'hat0uma/csvview.nvim'
Plug 'https://codeberg.org/evergarden/nvim.git', { 'as': 'evergarden' }

Plug 'tpope/vim-dadbod'
Plug 'kristijanhuask/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'mtdl9/vim-log-highlighting'

call plug#end()

lua require('csvview').setup()
