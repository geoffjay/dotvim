function! IsTreeOpen()
  return bufwinnr('NvimTree') != -1
endfunction

function! TreeToggle()
  if IsTreeOpen()
    NvimTreeClose
  else
    NvimTreeClose
    NvimTreeFindFile
  endif
endfunction

function! TreeRefresh()
  if IsTreeOpen()
    NvimTreeRefresh
  endif
endfunction
