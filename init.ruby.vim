" Clear existing commands
autocmd!

" let g:python2_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin(expand('~/.vim/bundle.ruby'))

  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'

  " useful functionality
  Plug 'kassio/neoterm'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'fholgado/minibufexpl.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-endwise'
  Plug 'dense-analysis/ale'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  let g:deoplete#enable_at_startup = 1

  " These aparently need to follow deoplete enable
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'

  " ruby/rails
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-rbenv'

  " pretty things up
  Plug 'arcticicestudio/nord-vim'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " repo says it needs to be loaded last
  Plug 'ryanoasis/vim-devicons'

call plug#end()

" editor setup

" TODO: switch all of the editor config to the base
call init#editor#colorscheme()
call init#editor#diffcolorscheme()
call init#editor#defaults()
call init#editor#columnwidth()
call init#editor#indentation()

call conf#editor#terminal()

" run plugin initialization

call conf#ctrlp#init()
call conf#lsp#init()
call conf#nerdtree#init()
call conf#powerline#init()

call init#ale#config()
call init#deoplete#config()

" filetype setup

call conf#filetypes#javascript()
call conf#filetypes#markdown()
call conf#filetypes#ruby()
call conf#filetypes#xml()

" ---
" test - should put in config file

set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Added these because I got stuck in vim inside of a :term within a buffer and C-\ C-n is mapped to ESC
" FIXME: these probably won't work with the variable as it is for job ID, more here as a reminder
" ,te -> terminal escape
" ,tw -> terminal write
" ,tr -> terminal carriage return
map <leader>te :execute "call jobsend(b:terminal_job_id, 0x1B)"<CR>
map <leader>tw :execute "call jobsend(b:terminal_job_id, ":wq")"<CR>
map <leader>tr :execute "call jobsend(b:terminal_job_id, 0x1B)"<CR>

" ---

" setup

let g:vimrc=expand('~/.config/nvim/init.ruby.vim')
map <leader>v :execute "sp" . g:vimrc<CR>
map <silent> <leader>V :execute "source " . g:vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{init#ale#status()}

call init#shortcuts#setup()
