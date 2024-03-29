local map = vim.api.nvim_set_keymap

local M = {}

M.config = function()
  local present, telescope = pcall(require, "telescope")

  if not present then
    return
  end

  telescope.setup({
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    pickers = {
      buffers = {
        sort_lastused = true,
        ignore_current_buffer = true,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg" },
        find_cmd = "rg", -- find command (defaults to `fd`)
      },
    },
  })

  local extensions = { "themes", "terms", "fzf" }
  local packer_repos = [["extensions", "telescope-fzf-native.nvim"]]

  if vim.fn.executable("ueberzug") == 1 then
    table.insert(extensions, "media_files")
    packer_repos = packer_repos .. ', "telescope-media-files.nvim"'
  end

  pcall(function()
    for _, ext in ipairs(extensions) do
      telescope.load_extension(ext)
    end
  end)

  local default_opts = { noremap = true, silent = true }
  map("n", ";", "<Cmd>Telescope buffers<CR>", default_opts)
  map("n", "<C-o>", "<Cmd>Telescope git_files<CR>", default_opts)
  map("n", "<C-g>", "<Cmd>Telescope live_grep<CR>", default_opts)
  map("n", "<C-p>", "<Cmd>Telescope lsp_definitions<CR>", default_opts)
  map("n", "<C-h>", "<Cmd>History<CR>", default_opts)
  map(
    "n",
    "<C-f>",
    "<Cmd>Telescope file_browser<CR>",
    default_opts
  )
  map(
    "v",
    "<C-f>",
    "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>",
    default_opts
  )
end

return M
