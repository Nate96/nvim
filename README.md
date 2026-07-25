Put local configs in `local.lua`.

For vscode and vscodevim (https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
add the following to user setting json to pick up the vim configs. Not everything
will be picked up but most will. 

```json
"vim.vimrc.enable": true,
"vim.vimrc.path": "~/.vimrc"
```

## Set up
1. Install Packer
   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```
2. Install Vim Plug
   ```bash
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs\
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
3. `cp ~/.config/nvim/.vimrc ~/`
4. Open `nvim ~/.config/nvim/lua/packer.lua` and run `:so`
5. run `:PackerSync`
6. restart nvim

