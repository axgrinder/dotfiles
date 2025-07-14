-- 📦 Load Packer
vim.cmd [[packadd packer.nvim]]

-- 📦 Plugin Manager Setup
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "preservim/nerdtree"

  -- Core Dev Tools
  use "nvim-lua/plenary.nvim"
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Python Tools
  use "mfussenegger/nvim-dap"
  use "mfussenegger/nvim-dap-python"
  use "akinsho/toggleterm.nvim"

  -- Optional: Clean Statusline
  use "nvim-lualine/lualine.nvim"
end)

-- 🧼 Basic Editor Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5

-- 🎨 Statusline (optional)
require("lualine").setup()

-- 🔧 Mason + Pyright LSP Setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" },
  automatic_installation = true,
})
require("lspconfig").pyright.setup({})

-- 🧹 Format & Lint with null-ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.ruff,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- 💻 IPython REPL via ToggleTerm
require("toggleterm").setup()
vim.keymap.set("n", "<leader>rp", ":ToggleTerm direction=horizontal<CR>ipython<CR>", { noremap = true, silent = true })

-- 🐍 Run current Python file
vim.keymap.set("n", "<leader>r", ":w<CR>:!python3 %<CR>", { noremap = true, silent = true })

-- 🐞 Python Debugging with nvim-dap
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
