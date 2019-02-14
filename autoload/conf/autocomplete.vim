" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
function conf#autocomplete#init()
  let g:SuperTabDefaultCompletionType    = '<C-n>'
  let g:SuperTabCrMapping                = 0
  "let g:UltiSnipsExpandTrigger           = '<tab>'
  "let g:UltiSnipsJumpForwardTrigger      = '<tab>'
  "let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
  "let g:ycm_confirm_extra_conf = 0
  "let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
  "let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

  " Plugin key-mappings.
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  imap <C-k>  <Plug>(neosnippet_expand_or_jump)
  "imap <C-k> <Plug>(neosnippet_expand_or_jump)
  "smap <C-k> <Plug>(neosnippet_expand_or_jump)
  "xmap <C-k> <Plug>(neosnippet_expand_target)
  "inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
endfunction
