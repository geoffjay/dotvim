local g = vim.g

if vim.fn.exists("$TMUX") == 1 then
  g.fzf_layout = {
    tmux = "-p 80%,80%",
  }
else
  g.fzf_layout = {
    window = {
      width = 0.7,
      height = 0.6,
    },
  }
end

g.fzf_preview_window = "right:60%:sharp"

g.fzf_colors = {
  fg = { "fg", "Normal" },
  bg = { "bg", "Normal" },
  hl = { "fg", "Label" },
  info = { "fg", "Comment" },
  border = { "fg", "Ignore" },
  prompt = { "fg", "Function" },
  pointer = { "fg", "Statement" },
  marker = { "fg", "Conditional" },
  spinner = { "fg", "Label" },
  header = { "fg", "Comment" },
}

g.fzf_colors["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" }
g.fzf_colors["bg+"] = { "bg", "CursorLine", "CursorColumn" }
g.fzf_colors["hl+"] = { "fg", "Label" }

vim.cmd("source ~/.config/nvim/viml/fzf.vim")
