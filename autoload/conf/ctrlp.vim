" Ctrl-P configuration
function conf#ctrlp#init()
  let g:ctrlp_match_window_bottom = 0
  let g:ctrlp_match_window_reversed = 0
  let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_dotfiles = 0
  let g:ctrlp_switch_buffer = 0
endfunction
