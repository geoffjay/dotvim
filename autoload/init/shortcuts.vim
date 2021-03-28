function! init#shortcuts#setup()
  :nmap \a Geoff Johnson, <geoff.jay@gmail.com><CR>
  :nmap \d <C-R>=strftime('%Y-%m-%d')<CR>
  :nmap \e :call TreeToggle()<CR>
  :nmap \r :call TreeRefresh()<CR>
  :nmap \f :YcmCompleter FixIt<CR>
  :nmap \l :setlocal number!<CR>
  :nmap \o :set paste!<CR>
  :nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
  :nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
  :nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
  :nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
  :nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
  " :nmap ; :CtrlPBuffer<CR>
endfunction
