require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
})
