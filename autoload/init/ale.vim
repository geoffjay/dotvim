function! init#ale#config()
  let g:ale_linters = {
    \ 'ruby': ['standardrb', 'rubocop'],
    \ 'python': ['flake8', 'pylint'],
    \ 'javascript': ['eslint'],
    \}
  let g:ale_fixers = {
    \ 'ruby': ['standardrb'],
    \}
  let g:ale_fix_on_save = 1
  let g:ale_sign_error = '●'
  let g:ale_sign_warning = '.'
endfunction

function! init#ale#status()
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
    \ '😞 %dW %dE',
    \ all_non_errors,
    \ all_errors
    \)
endfunction
