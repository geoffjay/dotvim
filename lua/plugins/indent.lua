-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#3B4252 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#2E3440 gui=nocombine]])

require("indent_blankline").setup({
  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
})
