function! conf#powerline#init()
  set guifont=Source\ Code\ Pro\ for\ Powerline
  let g:airline_powerline_fonts = 1
  "let g:airline_theme='gruvbox'
  let g:airline_theme='nord'
  "let g:airline_left_sep="\uE0C6"
  "let g:airline_right_sep="\uE0C7"
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#whitespace#mixed_indent_algo = 1
endfunction
