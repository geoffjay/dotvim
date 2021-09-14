function RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --glob "!.git/*" --column --line-number --no-heading --color=always --smart-case -- %s'
  let command = printf(command_fmt, shellescape(a:query))
  call fzf#vim#grep(command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

function! LiveRipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --glob "!.git/*" --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call LiveRipgrepFzf(<q-args>, <bang>0)
