-- Load Packer plugin manager
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'vim-airline/vim-airline'
	use 'preservim/nerdtree'
	use 'vimlab/vim-terminal'
    use 'neovim/nvim-lspconfig'
end)

-- Basic Neovim Settings
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.mouse=a
vim.opt.autoindent=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.smarttab=true
vim.opt.visualbell=true
vim.opt.scrolloff=5
vim.opt.expandtab=true
vim.opt.cursorline=true

