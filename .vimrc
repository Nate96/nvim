" ============================= OPTIONS =======================================
set relativenumber
set number
set expandtab
set smartindent
set tabstop=3
set softtabstop=3
set shiftwidth=3
set termguicolors
set nowrap

" cursor fixed in center
set scrolloff=99
set isfname+=@-@
set updatetime=50
set colorcolumn=80
set cursorline

" Blinking Cursor
set guicursor=n-v-c:block-blinkwait700-blinkoff400-blinkon250,i:ver25-blinkwait700-blinkoff400-blinkon250

" ============================= KEYBINDINGS ===================================
let g:mapleader = " "

" Open File Explorer
nnoremap <leader><leader> :Ex<CR>

" LSP Format Note: Standard Vim does not have built-in Neovim LSP. 
" This will only work if you are using this as an init.vim in Neovim.
nnoremap <leader>f :lua vim.lsp.buf.format()<CR>

" Paging up and down
noremap <C-j> <C-d>
noremap <C-k> <C-u>

" Save all buffers
nnoremap <C-z> <Esc>:wa! \| sus <CR>
inoremap <C-z> <Esc>:wa! \| sus <CR>
vnoremap <C-z> <Esc>:wa! \| sus <CR>

" split vertically
nnoremap <C-\> <C-w>v

" resizing windows
nnoremap <C-w>< 10<C-w><
nnoremap <C-w>> 10<C-w>>
nnoremap <C-w>+ 5<C-w>+
nnoremap <C-w>- 5<C-w>-

" windows block mode
nnoremap <leader>v <C-v>

" yanking text to system
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" Toggling Spell Checker
nnoremap <silent> <leader>s :set spell!<CR>

" remove highlight
nnoremap <ESC> :nohl<CR>

" terminal mode escape
tnoremap <ESC> <C-\><C-n>
