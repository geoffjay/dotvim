function conf#filetypes#latex()
  au BufRead,BufNewFile *.{tex,bib} setfiletype=latex
  au FileType tex call conf#util#AlternativeTabbing()
  au FileType tex set spell
endfunction

function conf#filetypes#markdown()
  au BufRead,BufNewFile *.{md,mdwn,mdk,mark*} setfiletype=markdown
  au FileType markdown call conf#util#AlternativeTabbing()
  au FileType markdown set spell
endfunction

function conf#filetypes#text()
  au BufRead,BufNewFile *.txt setfiletype=text
  au FileType text set spell
endfunction

function conf#filetypes#dotfiles()
  "au BufRead,BufNewFile .* setfiletype dotfiles
  "au FileType dotfiles call AlternativeTabbing()
endfunction

function conf#filetypes#c()
  au BufRead,BufNewFile *.c setfiletype c
  au FileType c so ~/.vim/syntax/gtk-highlight.vim
endfunction

function conf#filetypes#vala()
  au BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
  au BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
  au BufRead,BufNewFile *.vala setfiletype vala
  au BufRead,BufNewFile *.vapi setfiletype vala
  let vala_comment_strings = 1        " enable comment strings
  let vala_space_errors = 1           " highlight space errors
  let vala_no_tab_space_error = 1     " disable space-tab-space errors
  let tlist_vala_settings='c#;d:macro;t:typedef;n:namespace;c:class;E:event;g:enum;s:struct;i:interface;p:properties;m:method'
endfunction

function conf#filetypes#xml()
  au BufRead,BufNewFile *.{xml,xhtml,rdf,doap} setfiletype xml
  au FileType xml call conf#util#AlternativeTabbing()
endfunction

function conf#filetypes#ruby()
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.erb setfiletype ruby
  au FileType ruby call conf#util#AlternativeTabbing()
endfunction

function conf#filetypes#javascript()
  au BufRead,BufNewFile *.js setfiletype javascript
  au BufRead,BufNewFile *.ejs setfiletype javascript
  au FileType javascript call conf#util#AlternativeTabbing()
endfunction

function conf#filetypes#supp()
  au BufNewFile,BufRead *.supp set filetype=supp
endfunction

function conf#filetypes#python()
  au BufRead *.py set filetype=python
  "au FileType python call conf#util#AlternativeTabbing()
  " automatically strip trailing whitespace from python files
  "au BufWrite *.py :call conf#util#RmTrailingWsp()
endfunction
