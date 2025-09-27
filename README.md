My NeoVim Config

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
3. Open `lua/config/packer.lua` and run `:so`
4. run `:PackerSync`
5. restart nvim

