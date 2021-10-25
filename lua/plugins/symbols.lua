local map = vim.api.nvim_set_keymap

vim.g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false, -- experimental
  position = "right",
  preview_background_highlight = "Comment",
  width = 25,
  keymaps = {
    close = "<Esc>",
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    rename_symbol = "r",
    code_actions = "a",
  },
  lsp_blacklist = {},
}

map("n", "\\s", "<Cmd>SymbolsOutline<CR>", { noremap = true })
