" closetag configuration
function conf#closetag#init()
  let g:closetag_html_style=1
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
  let g:closetag_shortcut = '>'
  let g:closetag_close_shortcut = '<leader>>'
endfunction
