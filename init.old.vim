" Clear existing commands
autocmd!

" let g:python2_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.vim/bundle')

Plug 'airblade/vim-gitgutter'
Plug 'aklt/plantuml-syntax'
Plug 'alvan/vim-closetag'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'arcticicestudio/nord-vim'
" Plug 'c0r73x/neotags.nvim'
Plug 'cespare/vim-toml'
Plug 'cocopon/iceberg.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi'
Plug 'davidhalter/jedi-vim'
Plug 'davidhalter/parso'
Plug 'dense-analysis/ale'
Plug 'digitaltoad/vim-jade'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-plugin-tests'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'epilande/vim-react-snippets'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'fholgado/minibufexpl.vim'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'IN3D/vim-raml'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jparise/vim-graphql'
Plug 'jpo/vim-railscasts-theme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-metarw'
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'kingbin/vim-arduino'
Plug 'lifepillar/vim-gruvbox8'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/vim-metarw-etcd'
Plug 'mattn/webapi-vim'
Plug 'mgutz/vim-colors'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'nikvdp/ejs-syntax'
Plug 'pangloss/vim-javascript'
Plug 'peterhoeg/vim-qml'
Plug 'posva/vim-vue'
Plug 'PratikBhusal/vim-grip'
Plug 'previm/previm'
Plug 'rodjek/vim-puppet'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'rust-lang/rust.vim'
Plug 'sbl/scvim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sebdah/vim-delve'
Plug 'severin-lemaignan/vim-minimap'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deol.nvim'
Plug 'SirVer/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'stfl/meson.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
"Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/glib.vim'
Plug 'vim-scripts/gtk-vim-syntax'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/vim-mediawiki-editor'
"Plug 'vim-syntastic/syntastic'
Plug 'wakatime/vim-wakatime'
Plug 'wavded/vim-stylus'

Plug 'Valloric/YouCompleteMe'

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

" repo says it needs to be loaded last
Plug 'ryanoasis/vim-devicons'

call plug#end()

if !exists("g:os")
  if has("win64") || has("win32") || has("win16")
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

" set macligatures
set guifont=Inconsolata\ for\ Powerline:h15
" set guifont=Source\ Code\ Pro\ for\ Powerline:h15
" set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" Editor configuration
call conf#editor#colorscheme()
call conf#editor#diffcolorscheme()
call conf#powerline#init()

call conf#editor#defaults()
call conf#editor#columnwidth()
call conf#editor#indentation()
call conf#editor#easyalign()

" Strip trailing whitespace on save
au BufWritePre * :%s/\s\+$//e

" Plugin configuration
call conf#statusbar#init()
"call conf#syntastic#init()
call conf#ale#init()
call conf#autocomplete#init()
call conf#taglist#init()
call conf#tagbar#init()
call conf#ctrlp#init()
call conf#closetag#init()
call conf#gutentags#init()
call conf#neotags#init()
call conf#nerdtree#init()
call conf#jedi#init()
call conf#rust#init()
call conf#lsp#init()
call conf#supercollider#init()
call conf#previm#init()
call conf#taskwarrior#init()

" Filetype configuration
call conf#filetypes#latex()
call conf#filetypes#markdown()
call conf#filetypes#text()
"call conf#filetypes#dotfiles()
call conf#filetypes#c()
call conf#filetypes#vala()
call conf#filetypes#xml()
call conf#filetypes#ruby()
call conf#filetypes#javascript()
call conf#filetypes#supp()
"call conf#filetypes#python()
call conf#filetypes#dbout()

" Override comment color
hi Comment ctermfg=245

" additional macos/nvim specific settings
set mouse=

" minimap bindings
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'

" TODO: find a better place for this
let g:gundo_prefer_python3 = 1

" gitcommit specific
"autocmd Filetype gitcommit spell textwidth=72

" split preferences
"set splitright
"set splitbelow

"""
" key mappings, older versions of vim might need
"   C-v + C-m instead of <CR>
map ,v :sp ~/.vimrc<CR>
map <silent> ,V :source ~/.config/nvim/init.vim<CR>:exe ":echo 'vimrc reloaded'"<CR>

"map <F4> :TlistToggle<CR>
nmap <F4> :TagbarToggle<CR>
map <F5> :NERDTree<CR>
" map <F6> :call conf#util#MpdPause()<CR>
" map <F7> :call conf#util#MpdPlay()<CR>
map <F7> :call conf#util#DiffGetLocal()<CR>
" map <F8> :call conf#util#SaveCurrent()<CR>
" map <F9> :call conf#util#QuitAll()<CR>
map <F8> :make<CR>
map <F9> :call conf#util#EnableFolding()<CR>
map <F10> :call conf#util#DisableFolding()<CR>
"""
" C-s doesn't work in terminal mode
" map <silent> <C-S> :w<CR>
" imap <C-s> <C-o><C-s><CR>
"imap <C-v> <Esc><C-v>a

if g:os == "Darwin"
  :nmap \y :w !pbcopy<CR><CR>
  :nmap \p :r !pbpaste<CR><CR>
  " FIXME: add C-S-c & C-S-v equivalents
elseif g:os == "Linux"
  vmap <C-S-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
  "nmap <C-S-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
endif

"map <C-[> :resize +5<CR>
"map <C-]> :resize -5<CR>

"""
" some regular expressions to consider adding
" :%s/^\w*/\"\0\"/ => wrap first word in "
" :%s/\w*$/\"\0\"/ => wrap last word in "

"""
" Beautify JavaScript
nnoremap <leader>ff :%!js-beautify -j -q -B -f -<CR>

"""
" Ideas adapted from some genius at static.github.io/vim.html
:nmap \a Geoff Johnson, <geoff.jay@gmail.com><CR>
:nmap \c :CoVim start 14041 gjohn<CR>
:nmap \d <C-R>=strftime('%Y-%m-%d')<CR>
:nmap \e :NERDTree<CR>
:nmap \r :NERDTreeRefreshRoot<CR>
:nmap \f :YcmCompleter FixIt<CR>
:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>
:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
:nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
:nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
:nmap ; :CtrlPBuffer<CR>

" Netrw Style Listing
let g:netrw_liststyle = 3

nnoremap <Leader><Leader> :TagbarToggle<CR><C-W>h<C-W>s:e .<CR><C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>h
