local map = vim.api.nvim_set_keymap

vim.o.completeopt = "menuone,noselect"

require("compe").setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  allow_prefix_unmatch = false,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 1000,
  documentation = true,

  source = {
    path = true,
    buffer = { kind = "﬘", true },
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    snippets_nvim = true,
    treesitter = true,
  },
})

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-n>")
  elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
    return t("<Plug>(vsnip-expand-or-jump)")
  elseif check_back_space() then
    return t("<Tab>")
  else
    return vim.fn["compe#complete"]()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-p>")
  elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
    return t("<Plug>(vsnip-jump-prev)")
  else
    return t("<S-Tab>")
  end
end

map("i", "<Tab>", "v:lua.tab_complete()", { silent = true, expr = true })
map("s", "<Tab>", "v:lua.tab_complete()", { silent = true, expr = true })
map("i", "<S-Tab>", "v:lua.s_tab_complete()", { silent = true, expr = true })
map("s", "<S-Tab>", "v:lua.s_tab_complete()", { silent = true, expr = true })

-- compe mappings
map("i", "<C-Space>", "compe#complete()", { silent = true, expr = true })
map("i", "<CR>", "compe#confirm('<CR>')", { silent = true, expr = true })
map("i", "<C-e>", "compe#close('<C-e>')", { silent = true, expr = true })
map(
  "i",
  "<C-f>",
  "compe#scroll({ 'delta': +4 })",
  { silent = true, expr = true }
)
map(
  "i",
  "<C-d>",
  "compe#scroll({ 'delta': -4 })",
  { silent = true, expr = true }
)
