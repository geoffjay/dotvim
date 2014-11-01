" Statusbar configuration
function conf#statusbar#init()
  set laststatus=2
  set statusline=
  set statusline+=%f\                    " file name
  set statusline+=%h%1*%m%r%w%0*         " flags
  set statusline+=%=                     " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset
endfunction
