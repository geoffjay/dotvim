function init#editor#defaults()
  " set to auto read when a file is changed from outside of the buffer
  set autoread

  " highlighting for various file types
  syntax on

  " enable filetype plugin
  filetype on
  filetype plugin on
  filetype indent on

  set history=250
  " tab completion for filenames, help topics, option names
  set wildmode=list:longest,full
  " for displaying lists with bullets (i think)
  execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)

  " set the map leader for key combinations
  let mapleader=","
  let g:mapleader=","

  " editor options
  set showmode
  set showcmd
  set nocompatible        " prevents vi like bugs and behaviour
  set mouse=a
  set nomodeline
  set showmatch
  set ruler
  set number
  set cursorline
  set nostartofline       " don't jump to first char while paging
  set equalalways         " force splits to be 50/50
  set backspace=indent,eol,start
  set modeline

  " text formatting
  set nowrap
  set tabstop=4
  set expandtab
  set smarttab
  set shiftwidth=4
  set softtabstop=4
  set shiftround
  set autoindent
  set smartindent

  " search & replace
  set ignorecase
  set smartcase
  set incsearch
  set gdefault

  " persistent undo if version is 7.3 or later
  if v:version >= 7.3
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000   " maximum number of changes that can be undone
    set undoreload=10000  " maximum number lines to save for undo on a buffer reload
  endif

  set encoding=utf-8

  " disable preview window
  set completeopt-=preview
endfunction

" Setup color scheme
function init#editor#colorscheme()
  set t_Co=256
  "set term=xterm-256color
  set background=dark
  colorscheme nord
  augroup nord-theme-overrides
    autocmd!
    " Use 'nord7' as foreground color for Vim comment titles. eg.
    " TODO:
    " Test:
    " Title:
    " NOTE:
    " FIXME:
    " XXX:
    autocmd ColorScheme nord highlight vimCommentTitle ctermfg=14 guifg=#8FBCBB
  augroup END
  let g:nord_bold_vertical_split_line = 1
  let g:nord_uniform_diff_background = 1
  " let g:nord_bold = 0
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_underline = 1
endfunction

function init#editor#diffcolorscheme()
  hi DiffAdd      gui=none    guifg=NONE               guibg=g:terminal_color0
  hi DiffChange   gui=none    guifg=NONE               guibg=g:terminal_color2
  hi DiffDelete   gui=bold    guifg=g:terminal_color10 guibg=g:terminal_color3
  hi DiffText     gui=none    guifg=NONE               guibg=g:terminal_color5
endfunction

function init#editor#indentation()
  " configure indentation guide colors
  let g:indent_guides_auto_colors = 0
  au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
endfunction

" Highlight lines that go too long
function init#editor#columnwidth()
  au BufRead * hi OverLength ctermbg=blue ctermfg=white guibg=#592929
  au BufRead * match OverLength /\%121v.\+/

  " set a bar for the column width
  if exists('+colorcolumn')
    set colorcolumn=121
    hi ColorColumn ctermbg=7
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>121v.\+', -1)
  endif
endfunction
