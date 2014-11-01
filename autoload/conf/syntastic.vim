" Syntastic configuration
function conf#syntastic#init()
  let g:syntastic_enable_highlighting = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_error_symbol = 'e>'
  let g:syntastic_warning_symbol = 'w>'
  let g:syntastic_style_error_symbol = 's>'
  let g:syntastic_style_warning_symbol = 's>'
  let g:syntastic_enable_balloons = 1
  let g:syntastic_mode_map = { 'mode': 'active',
                          \ 'active_filetypes': ['vala', 'c'],
                          \ 'passive_filetypes': ['bash'] }
  let g:syntastic_javascript_checkers = ['eslint']
  "let g:syntastic_vala_modules = 'dcs-build dcs-core-0.2 dcs-ui-0.2 dcs-cli-0.2 dcs-daq-0.2 dcs-net-0.2 dcs-control-0.2'
  let g:syntastic_vala_modules = 'dcs-build dcs-core-0.2'
  let g:syntastic_vala_vapi_dirs = '~/Dropbox/Projects/opendcs/dcs/src/libdcs-core/'
  " for solarized dark - http://ethanschoonover.com/solarized
  "  - core01 = #586e75
  "  - core1  = #93a1a1
  hi SyntasticError guifg=#586e75 guibg=#93a1a1
  hi SyntasticWarning guifg=#586e75 guibg=#93a1a1
  hi SyntasticErrorSign guifg=#586e75 guibg=#93a1a1
  hi SyntasticWarningSign guifg=#586e75 guibg=#93a1a1
endfunction
