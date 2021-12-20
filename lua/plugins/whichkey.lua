local map = vim.api.nvim_set_keymap
local wk = require("whichkey_setup")

local keymap = {
  w = { ":w!<CR>", "save file" },
  s = "sort",
  d = { name = "+dadbod" },
  g = { name = "+gh-line" },
  h = { name = "+git-gutter" },
  f = {
    name = "+find",
    b = { "<Cmd>Telescope buffers<CR>", "buffers" },
    h = { "<Cmd>Telescope help_tags<CR>", "help tags" },
    c = {
      name = "+commands",
      c = { "<Cmd>Telescope commands<CR>", "commands" },
      h = { "<Cmd>Telescope command_history<CR>", "history" },
    },
    q = { "<Cmd>Telescope quickfix<CR>", "quickfix" },
    g = {
      name = "+git",
      g = { "<Cmd>Telescope git_commits<CR>", "commits" },
      c = { "<Cmd>Telescope git_bcommits<CR>", "bcommits" },
      b = { "<Cmd>Telescope git_branches<CR>", "branches" },
      s = { "<Cmd>Telescope git_status<CR>", "status" },
    },
  },
  p = {
    name = "+pretty",
    j = { ":%!python -m json.tool<CR>", "json" },
  },
}

wk.register_keymap("leader", keymap)

map(
  "n",
  "\\ww",
  ":WhichKeyVisual '<leader>'<CR>",
  { noremap = true, silent = true }
)
map(
  "v",
  "\\ww",
  ":WhichKeyVisual '<leader>'<CR>",
  { noremap = true, silent = true }
)
map("n", "\\we", ":WhichKeyVisual ''<CR>", { noremap = true, silent = true })
map("v", "\\we", ":WhichKeyVisual ''<CR>", { noremap = true, silent = true })
