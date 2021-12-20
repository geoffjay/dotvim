function! init#shortcuts#setup()
  :nmap \a Geoff Johnson, <geoff.jay@gmail.com><CR>
  :nmap \b :PaqInstall
  :nmap \d <C-R>=strftime('%Y-%m-%d')<CR>
  :nmap \l :setlocal number!<CR>
  :nmap \o :set paste!<CR>
  :nmap \tst :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
  :nmap \tsm :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
  :nmap \tsT :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
  :nmap \tsM :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
  :nmap \wr :setlocal wrap!<CR>:setlocal wrap?<CR>
endfunction
