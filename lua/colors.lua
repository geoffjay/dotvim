local M = {}

-- nord
M.colors = {
  black = "#2E3440",
  grey1 = "#3B4252",
  grey2 = "#434C5E",
  grey3 = "#4C566A",
  grey_bright = "#616E88",
  fg = "#D8DEE9",
  white1 = "#E5E9F0",
  white2 = "#ECEFF4",
  teal = "#8FBCBB",
  cyan = "#88C0D0",
  blue = "#81A1C1",
  dark_blue = "#5E81AC",
  red = "#BF616A",
  orange = "#D08770",
  yellow = "#EBCB8B",
  green = "#A3BE8C",
  purple = "#B48EAD",
  highlight = "#7B88A1",
}

M.hi = function(group, guifg, guibg, attr, guisp)
  local fg = guifg ~= "" and "guifg=" .. guifg or "guifg=NONE"
  local bg = guibg ~= "" and "guibg=" .. guibg or "guibg=NONE"
  local style = attr ~= "" and "gui=" .. attr or "gui=NONE"
  local sp = guisp ~= "" and "guisp=" .. guisp or ""

  local hl = "hi "
    .. group
    .. " "
    .. fg
    .. " "
    .. bg
    .. " "
    .. style
    .. " "
    .. sp
  vim.api.nvim_command(hl)
end

local c = M.colors
local hi = M.hi

local function highlight_plugins()
  -- nvim-tree
  hi("NvimTreeIndentMarker", c.grey3, "", "", "")
  hi("NvimTreeFolderIcon", c.fg, "", "", "")
  hi("NvimTreeRootFolder", c.teal, "", "bold", "")
  hi("NvimTreeFolderName", c.blue, "", "", "")
  hi("NvimTreeEmptyFolderName", c.grey_bright, "", "", "")
  hi("NvimTreeImageFile", c.yellow, "", "", "")
  hi("NvimTreeExecFile", c.green, "", "", "")
  hi("NvimTreeSpecialFile", c.dark_blue, "", "underline", "")
  hi("NvimTreeGitDirty", c.yellow, "", "", "")
  hi("NvimTreeGitNew", c.green, "", "", "")
  hi("NvimTreeGitDeleted", c.red, "", "", "")

  -- symbols-outline
  hi("FocusedSymbol", c.black, c.yellow, "bold", "")

  -- telescope
  hi("TelescopePromptBorder", c.cyan, "", "bold", "")
  hi("TelescopeResultsBorder", c.blue, "", "bold", "")
  hi("TelescopePreviewBorder", c.green, "", "bold", "")
  hi("TelescopeSelection", c.fg, c.grey2, "", "")
  hi("TelescopeMultiSelection", c.fg, c.grey2, "bold", "")
  hi("TelescopeSelectionCaret", c.red, c.grey2, "bold", "")
  hi("TelescopeMatching", c.purple, "", "bold", "")
end

M.config = function()
  highlight_plugins()
end

return M
