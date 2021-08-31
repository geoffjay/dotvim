require("utility")

-- install plugin manager
local function paq_install()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/paqs/opt/paq-nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command(
      "!git clone https://github.com/savq/paq-nvim.git " .. install_path
    )
  end
end

vim.g["mapleader"] = ","

-- setup plugin manager
paq_install()
vim.cmd("packadd paq-nvim")
require("paq")({
  -- let paq manage itself
  { "savq/paq-nvim", opt = true },

  -- appearance
  "arcticicestudio/nord-vim",
  "kyazdani42/nvim-web-devicons",
  "hoob3rt/lualine.nvim",
  "akinsho/bufferline.nvim",

  -- utility
  "airblade/vim-gitgutter",
  "editorconfig/editorconfig-vim",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "kyazdani42/nvim-tree.lua",
  "ruanyl/vim-gh-line",
  "tpope/vim-commentary",
  "christoomey/vim-tmux-navigator",
  "vim-test/vim-test",
  "benmills/vimux",
  "mg979/vim-visual-multi",

  -- languages
  "vim-ruby/vim-ruby",
  "tpope/vim-bundler",
  "tpope/vim-rails",
  "tpope/vim-rake",
  "tpope/vim-rbenv",
  "mattn/vim-goimports",

  -- code completion
  "hrsh7th/nvim-compe",
  "neovim/nvim-lspconfig",
  "onsails/lspkind-nvim",
})

-- autoload configurations
vim.call("init#editor#colorscheme")
vim.call("init#editor#diffcolorscheme")
vim.call("init#editor#defaults")
vim.call("init#editor#columnwidth")
vim.call("init#editor#indentation")
vim.call("conf#editor#terminal")

-- lua configurations
require("plugins/completion")
require("plugins/lsp")
require("plugins/tree")
require("plugins/statusline")
require("plugins/bufferline")

-- shortcuts
vim.call("init#shortcuts#setup")
