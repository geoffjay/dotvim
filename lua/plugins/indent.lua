-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#2E3440 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#3B4252 gui=nocombine]])

-- default colors
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#2E3440 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#A3BE8C gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#81A1C1 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#B48EAD gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#EBCB8B gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#D08770 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent7 guifg=#BF616A gui=nocombine]])
-- alt colors
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#3B4252 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#434C5E gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#4C566A gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#D8DEE9 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#E5E9F0 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent7 guifg=#ECEFF4 gui=nocombine]])

require("indent_blankline").setup({
  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    -- "IndentBlanklineIndent3",
    -- "IndentBlanklineIndent4",
    -- "IndentBlanklineIndent5",
    -- "IndentBlanklineIndent6",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
  space_char_blankline = " ",
})
