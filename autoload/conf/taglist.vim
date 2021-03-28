" Taglist configuration
function conf#taglist#init()
  let Tlist_Show_One_File = 1
  let Tlist_WinWidth = 60
  let Tlist_Use_Right_Window = 1
  let Tlist_Enable_Fold_Column = 0
  let Tlist_Exit_OnlyWindow = 1
  let Tlist_Use_SingleClick = 1
  let Tlist_Inc_Winwidth = 0

  let g:tlist_vala_settings = 'c#;d:macro;t:typedef;n:namespace;c:class;' .
    \ 'E:event;g:enum;s:struct;i:interface;' .
    \ 'p:properties;m:method'
  let g:tlist_markdown_settings = 'markdown;h:Headings'
  let g:tlist_tex_settings = 'latex;l:labels;s:sections;' .
    \ 't:subsections;u:subsubsections'
  let g:tlist_make_settings = 'make;m:macros;t:targets'
  let g:tlist_rust_settings = 'rust;m:module;c:constant;d:macro;g:enum;' .
    \ 's:struct;u:union;t:trait;T:typedef;v:variable;f:function'
  let s:tlist_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
    \ 'v:variable;f:function'
endfunction
