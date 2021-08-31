-- line-numbers must be declared before dashboard
-- init because otherwise dashboard shows line numbers
vim.opt.nu = true
vim.opt.rnu = true

require("globals")
require("plugins.dashboard-config")

-- autocomplete configuration
require("plugins.compe-config")
-- Langauge server configuration
require("lsp-config")
-- general configurations
require("options")
-- configuration to help you remember keybindings
require("plugins.which-key-config")
-- nvim tree
require("plugins.nvimtree-config")
-- extra plugins(with shorter configs)
require("plugins.misc")
-- source our mappings last(may change)
vim.cmd("source ~/.config/nvim/ng/viml/maps.vim")
-- auto-commands
vim.cmd("source ~/.config/nvim/ng/viml/autocmd.vim")
-- user configurations
require("rc")
