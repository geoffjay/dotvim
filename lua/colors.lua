local M = {}

-- check colors with ":so $VIMRUNTIME/syntax/hitest.vim"

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

M.italicize = function(group)
  local hl = "hi " .. group .. " gui=italic cterm=italic"
  vim.api.nvim_command(hl)
end

local c = M.colors
local hi = M.hi
local italicize = M.italicize

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
  hi("TelescopeNormal", c.fg, c.grey1, "", "")
  hi("TelescopeBorder", c.grey_bright, c.grey3, "bold", "")

  hi("TelescopePromptBorder", c.grey3, c.grey3, "bold", "")
  hi("TelescopePromptNormal", c.grey1, c.grey3, "bold", "")
  hi("TelescopePromptPrefix", c.red, c.grey3, "bold", "")
  hi("TelescopePromptCounter", c.red, c.grey3, "bold", "")
  hi("TelescopePromptTitle", c.blue, c.grey3, "bold", "")

  hi("TelescopeResultsBorder", c.grey1, c.grey1, "bold", "")
  hi("TelescopeResultsTitle", c.green, c.grey1, "bold", "")

  hi("TelescopePreviewBorder", c.grey1, c.grey1, "bold", "")
  hi("TelescopePreviewTitle", c.purple, c.grey1, "bold", "")

  hi("TelescopeMatching", c.purple, "", "bold", "")
  hi("TelescopeMultiSelection", c.fg, c.grey2, "bold", "")
  hi("TelescopeSelection", c.fg, c.grey2, "", "")
  hi("TelescopeSelectionCaret", c.red, c.grey2, "bold", "")
end

-- misc highlight overrides
local function highlight_misc()
  hi("RedrawDebugNormal", c.grey1, c.white2, "", "")
  hi("RedrawDebugClear", c.grey1, c.yellow, "", "")
  hi("RedrawDebugComposed", c.grey1, c.green, "", "")
  hi("RedrawDebugRecompose", c.grey1, c.red, "", "")
  hi("IndentGuidesEven", c.grey1, c.green, "", "")
  hi("IndentGuidesOdd", c.grey1, c.red, "", "")
end

-- syntax highlighting overrides
local function highlight_syntax()
  hi("Boolean", c.orange, "", "", "")
  hi("Comment", c.grey_bright, "", "", "")
  hi("Decorator", c.orange, "", "", "")

  -- GraphQL overrides
  -- FIXME: this should be in an autocmd? doesn't work this way
  if vim.bo.filetype == "graphql" then
    hi("Comment", c.orange, "", "", "")
    hi("Keyword", c.orange, "", "", "")
  end
end

-- these are less color and more display
local function italicize_syntax()
  italicize("Comment")
  italicize("Conditional")
  italicize("Constant")
  italicize("Function")
  italicize("Keyword")
  italicize("SpecialComment")
  italicize("Todo")

  italicize("luaCustomFunction")
end

M.config = function()
  highlight_misc()
  highlight_plugins()
  highlight_syntax()
  italicize_syntax()
end

return M
