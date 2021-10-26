require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
})
