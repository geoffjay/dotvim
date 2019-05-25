" LSP configuration
function conf#lsp#init()
  set hidden
  set signcolumn=yes

  let g:LanguageClient_autoStart = 0
  nnoremap <leader>lcs :LanguageClientStart<CR>

  " if you want it to turn on automatically
  " let g:LanguageClient_autoStart = 1

  " Add this for typescript:
  "\ 'javascript': ['javascript-typescript-stdio'],

  let g:LanguageClient_serverCommands = {
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'go': ['go-langserver'],
    \ }

  let g:LanguageClient_loadSettings = 1
  let g:LanguageClient_settingsPath = '/home/crdc/.vim/settings.json'
  set completefunc=LanguageClient#complete
  set formatexpr=LanguageClient_textDocument_rangeFormatting()

  let $RUST_BACKTRACE = 1
  let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
  let g:LanguageClient_loggingLevel = 'INFO'
  let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

  noremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
  noremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  noremap <silent> gr :call LanguageClient#textDocument_references()<CR>
  noremap <silent> gs :call LanugageClient#textDocument_documentSymbol()<CR>
  noremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endfunction
