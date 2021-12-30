local map = vim.api.nvim_set_keymap
-- TODO: test and use this?
-- local map = require("utility").map

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
  "akinsho/bufferline.nvim",
  "arcticicestudio/nord-vim",
  "hoob3rt/lualine.nvim",
  "kyazdani42/nvim-web-devicons",
  "lukas-reineke/indent-blankline.nvim",
  "luukvbaal/stabilize.nvim",
  "norcalli/nvim-colorizer.lua",

  -- utility
  "airblade/vim-gitgutter",
  "APZelos/blamer.nvim",
  "editorconfig/editorconfig-vim",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "kyazdani42/nvim-tree.lua",
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-refactor",
  "ruanyl/vim-gh-line",
  "tpope/vim-commentary",
  "christoomey/vim-tmux-navigator",
  "vim-test/vim-test",
  "benmills/vimux",
  "mg979/vim-visual-multi",
  "glepnir/dashboard-nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  "nvim-telescope/telescope-media-files.nvim",
  "windwp/nvim-autopairs",
  "yamatsum/nvim-cursorline",
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "puremourning/vimspector",
  "liuchengxu/vim-which-key",
  "AckslD/nvim-whichkey-setup.lua",

  -- languages
  "akinsho/flutter-tools.nvim",
  "dart-lang/dart-vim-plugin",
  "fatih/vim-go",
  "leafgarland/typescript-vim",
  "mattn/vim-goimports",
  "maxmellon/vim-jsx-pretty",
  "peitalin/vim-jsx-typescript",
  "rust-lang/rust.vim",
  "simrat39/rust-tools.nvim",
  "tpope/vim-bundler",
  "tpope/vim-rails",
  "tpope/vim-rake",
  "tpope/vim-rbenv",
  "vim-ruby/vim-ruby",

  -- syntax
  "cespare/vim-toml",
  "fladson/vim-kitty",
  "jparise/vim-graphql",
  "luisjure/csound-vim",
  "styled-components/vim-styled-components",

  -- LSP / code completion / IDE
  "hrsh7th/nvim-compe",
  "neovim/nvim-lspconfig",
  "onsails/lspkind-nvim",
  "ray-x/lsp_signature.nvim",
  "simrat39/symbols-outline.nvim",

  -- code snippets
  "cstrap/python-snippets",
  "dcampos/compe-snippy",
  "dcampos/nvim-snippy",
  "golang/vscode-go",
  "honza/vim-snippets",
  "hrsh7th/vim-vsnip",
  "rust-lang/vscode-rust",
  "xabikos/vscode-javascript",
  "ylcnfrht/vscode-python-snippet-pack",
})

-- vimscript configurations
vim.call("init#editor#colorscheme")
vim.call("init#editor#diffcolorscheme")
vim.call("init#editor#defaults")
vim.call("init#editor#columnwidth")
vim.call("init#editor#indentation")
vim.call("init#editor#terminal")

require("colors").config()

-- plugin configurations
require("plugins.blamer").config()
require("plugins.bufferline").config()
require("plugins.completion")
require("plugins.dashboard")
require("plugins.db")
require("plugins.flutter")
require("plugins.fzf")
require("plugins.indent")
require("plugins.lsp").config()
require("plugins.misc")
require("plugins.rust")
require("plugins.snippy")
require("plugins.statusline")
require("plugins.symbols")
require("plugins.telescope").config()
require("plugins.tree")
require("plugins.treesitter")
require("plugins.whichkey")

-- TODO: move these sections into new lua files

-- tmux
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2
map("n", "<C-Left>", ":TmuxNavigateLeft<CR>", {
  noremap = true,
  silent = true,
})
map("n", "<C-Down>", ":TmuxNavigateDown<CR>", {
  noremap = true,
  silent = true,
})
map("n", "<C-Up>", ":TmuxNavigateUp<CR>", { noremap = true, silent = true })
map(
  "n",
  "<C-Right>",
  ":TmuxNavigateRight<CR>",
  { noremap = true, silent = true }
)

-- disable visual-multi-mappings that bind to ctrl up/down which are being used with tmux
vim.g.VM_default_mappings = 0

-- autocmds
vim.api.nvim_command([[
augroup SpellCheck
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell
augroup END
]])
vim.api.nvim_command([[
augroup DisableFolding
autocmd FileType dbout setlocal nofoldenable
autocmd FileType dbout setlocal wrap
autocmd FileType dbout setlocal nolist
autocmd FileType dbout setlocal linebreak
autocmd FileType dbout setlocal breakindent
autocmd FileType dbout setlocal showbreak=ͱ
augroup END
]])

-- vim-test / vimux
vim.g["test#strategy"] = "vimux" -- make test commands execute using vimux
vim.g["VimuxUseNearest"] = 0 -- don't use an exisiting pane
vim.g["VimuxHeight"] = "20"
map("n", "<C-t>", ":w<CR> :TestFile<CR>", { noremap = true })
map("n", "<C-l>", ":w<CR> :TestNearest<CR>", { noremap = true })

-- commentary
map("v", ",cc", ":Commentary<CR>", { noremap = true })
map("v", ",cs", ":Commentary<CR>", { noremap = true })

-- helpers
map("n", ",a", "<esc>ggVG<CR>", { noremap = true })
map("v", ",s", "!sort<CR>", { noremap = true })

-- shortcuts
vim.call("init#shortcuts#setup")
