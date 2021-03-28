" ALE configuration
function conf#ale#init()
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_save = 1
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'css': ['prettier'],
  \}
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
  " Use ALE as completion sources for all code.
  "call deoplete#custom#option('sources', {
  "\ '_': ['ale'],
  "\})
  let g:ale_sign_error = '●'
  let g:ale_sign_warning = '.'
endfunction
