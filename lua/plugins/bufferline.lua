local map = vim.api.nvim_set_keymap

vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
    numbers = function(opts)
      return string.format('%s)', opts.id)
    end,
    close_command = 'bdelete! %d',
    right_mouse_command = 'bdelete! %d',
    left_mouse_command = 'buffer %d',
    middle_mouse_command = nil,
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match('error') and ' ' or ' '
      return ' ' .. icon .. count
    end,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left'
      }
    },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = 'thin',
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'directory',
  }
}

map('n', ';', '<Cmd>Buffers<CR>', {noremap = true})
map('n', 'gb', '<Cmd>BufferLinePick<CR>', {noremap = true})
map('n', '<Leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', {noremap = true})
map('n', '<Leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', {noremap = true})
map('n', '<Leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', {noremap = true})
map('n', '<Leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', {noremap = true})
map('n', '<Leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', {noremap = true})
map('n', '<Leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', {noremap = true})
map('n', '<Leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', {noremap = true})
map('n', '<Leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', {noremap = true})
map('n', '<Leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', {noremap = true})
