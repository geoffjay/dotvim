local map = vim.api.nvim_set_keymap

map("n", "<leader>du", "<Cmd>DBUIToggle<CR>", {
  noremap = true,
  silent = true,
})
map(
  "n",
  "<leader>df",
  "<Cmd>DBUIFindBuffer<CR>",
  { noremap = true, silent = true }
)
map(
  "n",
  "<leader>dr",
  "<Cmd>DBUIRenameBuffer<CR>",
  { noremap = true, silent = true }
)
map("n", "<leader>dl", "<Cmd>DBUIToggle<CR>", {
  noremap = true,
  silent = true,
})

vim.g.db_ui_use_nerd_fonts = true
vim.g.db_ui_save_location = "~/.config/db_ui"
