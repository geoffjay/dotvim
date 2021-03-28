function! conf#util#RmTrailingWsp()
  :%s/\s\+$//
endfunction

function! conf#util#DisableFolding()
  echo "Code folding disabled"
  set nofoldenable
  set foldcolumn=0
endfunction

function! conf#util#EnableFolding()
  echo "Code folding enabled"
  set foldenable
  set foldcolumn=2
  set foldmethod=indent
  set foldminlines=2
  set foldlevel=4
  set foldopen=
endfunction

function! conf#util#AlternativeTabbing()
  echo "Enabling alternative tabbing settings"
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
endfunction

function! conf#util#DefaultTabbing()
  echo "Enabling default tabbing settings"
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
endfunction

function! conf#util#BashTabbing()
  echo "Enabling bash style tabbing"
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set noexpandtab
endfunction

" another way of generating incremented numbers
"=============================================================================
" File: increment.vim
" Author: Stanislav Sitar
" Put increment.vim into a plugin directory.
" Use in replacement strings
" :let I=0
" :%s/my_token_word_to_be_replaced_by_the_auto_incremented_numbers/\=INC(1)/
" or
" :let I=95
" :%s/@/\=INC(5)/
" to replace each occurrence of character @ with numbers starting with 100 and
" growing by 5 (100, 105, 110, ...)
let g:I=0
function! AddIncrement(increment)
  let g:I= g:I + a:increment
  return g:I
endfunction

" TODO: These are probably pretty pointless, consider cleaning up

function! conf#util#DiffGetLocal()
  :diffg LO
endfunction

function! conf#util#SaveCurrent()
  :w
endfunction

function! conf#util#QuitAll()
  :qall
endfunction

function! MpdPause()
  echo "MPD server - Pause"
  :call system("mpc pause")
endfunction

function! MpdPlay()
  echo "MPD server - Play"
  :call system("mpc play")
endfunction

