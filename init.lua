local map = vim.api.nvim_set_keymap

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
  "glepnir/dashboard-nvim",

  -- languages
  "vim-ruby/vim-ruby",
  "tpope/vim-bundler",
  "tpope/vim-rails",
  "tpope/vim-rake",
  "tpope/vim-rbenv",
  "mattn/vim-goimports",

  -- syntax
  "cespare/vim-toml",

  -- code completion
  "hrsh7th/nvim-compe",
  "neovim/nvim-lspconfig",
  "onsails/lspkind-nvim",
})

-- vimscript configurations
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

-- XXX

-- TODO: move into a new shortcuts.lua file
map("n", ";", "<Cmd>Buffers<CR>", { noremap = true })
map("n", "<C-o>", "<Cmd>Buffers<CR>", { noremap = true })
map("n", "<C-p>", "<Cmd>Files<CR>", { noremap = true })
map("n", "<C-h>", "<Cmd>History<CR>", { noremap = true })

-- TODO: move into new tmux/test.lua files
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2
map("n", "<C-Left>", ":TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-Down>", ":TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-Up>", ":TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-Right>", ":TmuxNavigateRight<CR>", { silent = true })

-- disable visual-multi-mappings that bind to ctrl up/down which are being used with tmux
vim.g.VM_default_mappings = 0

-- vim-test / vimux
vim.g["test#strategy"] = "vimux" -- make test commands execute using vimux
vim.g["VimuxUseNearest"] = 0 -- don't use an exisiting pane
vim.g["VimuxHeight"] = "20"
map("n", "<C-t>", ":w<CR> :TestFile<CR>", { noremap = true })
map("n", "<C-l>", ":w<CR> :TestNearest<CR>", { noremap = true })

-- XXX

-- shortcuts
vim.call("init#shortcuts#setup")
