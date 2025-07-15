# dotfiles
configuration files for linux/ubuntu, neovim, etc.


# init.lua requirements
requires Node version >=14
  
Terminal: 
  
      curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
      sudo apt-get install -y nodejs
Open mason file: 
  
    nvim ~/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim/lua/mason-lspconfig/features/automatic_enable.lua
comment out the line:

      -- automatic_installation.enable()
save and close
open vim and enter: 
  
      :PackerCompile
      :PackerSync
