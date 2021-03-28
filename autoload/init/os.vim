" if g:os == "Darwin"
"   :nmap \y :w !pbcopy<CR><CR>
"   :nmap \p :r !pbpaste<CR><CR>
"   " FIXME: add C-S-c & C-S-v equivalents
" elseif g:os == "Linux"
"   vmap <C-S-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
"   "nmap <C-S-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
" endif

function init#os#setup()
  let g:os = init#os#release()
  let g:sys_version = init#os#version()
endfunction

function init#os#release()
  return substitute(system('uname'), '\n', '', '')
endfunction

function! init#os#version()
  let os=init#os#release()
  if os == 'Darwin' || os == 'Mac'
    let sys_version=substitute(system('sw_vers -productVersion'), '\n', '', '')
  elseif os == 'Linux'
    let sys_version=substitute(system('lsb_release -rs'), '\n', '', '')
  endif
  return sys_version
endfunction
