-- statusline
require("lualine").setup({
  options = {
    theme = "nord",
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_a = { { "mode", upper = true } },
    lualine_b = { { "branch", icon = "" } },
    lualine_c = { { "filename", file_status = true } },
    lualine_x = { "encoding", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})

vim.api.nvim_command("set noshowmode")
