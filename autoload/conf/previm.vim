" Previm configuration
function conf#previm#init()
  let g:previm_open_cmd = 'google-chrome'
  augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mark*} set filetype=markdown
  augroup end
endfunction
