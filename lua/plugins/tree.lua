local g = vim.g
local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
  auto_resize = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  -- remove all default bindings.
  disable_default_keybindings = true,

  -- add some defaults back in
  bindings = {
    { key = { "<CR>" }, cb = tree_cb("edit") },
    { key = { "<2-LeftMouse>" }, cb = tree_cb("edit") },
    { key = { "<2-RightMouse>" }, cb = tree_cb("cd") },
    { key = { "<C-t>" }, cb = tree_cb("tabnew") }, -- this is now opening the window picker which I don"t want. How can I new tab open now?
    { key = { "R" }, cb = tree_cb("refresh") },
    { key = { "a" }, cb = tree_cb("create") },
    { key = { "d" }, cb = tree_cb("remove") },
    { key = { "r" }, cb = tree_cb("rename") },
    { key = { "<C-r>" }, cb = tree_cb("full_rename") },
    { key = { "x" }, cb = tree_cb("cut") },
    { key = { "c" }, cb = tree_cb("copy") },
    { key = { "p" }, cb = tree_cb("paste") },
    { key = { "q" }, cb = tree_cb("close") },
  },
})

g.nvim_tree_ignore = { ".git", "node_modules", ".cache", ".DS_Store" }
g.nvim_tree_auto_ignore_ft = { "dashboard" }
g.nvim_tree_width = 40
g.nvim_tree_indent_markers = 1
g.nvim_tree_show_icons = {
  folders = 1,
  files = 1,
  git = 0,
}
g.nvim_tree_special_files = {
  "README.md",
  1,
  "Makefile",
  1,
}
g.nvim_tree_git_hl = 1
g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  },
}

vim.cmd("source ~/.config/nvim/viml/tree.vim")
