" neotags configuration
function conf#gutentags#init()
  let g:gutentags_cache_dir = '~/.gtags'
  let g:gutentags_exclude_filetypes = [
  \  'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git',
  \  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
  \  'Dockerfile', '*.Dockerfile',
  \  'Makefile', '*.Makefile', 'Makefile.*', '*.mk',
  \  '*-lock.json',  '*.lock',
  \  '*.min.*',
  \  '*.conf', '*.ini', '*.json', '*.y*ml', '*.toml',
  \  '*.bak',
  \  '*.zip',
  \  '*.pyc',
  \  '*.class',
  \  '*.tmp',
  \  '*.cache',
  \  '*.vscode',
  \  '*.swp', '*.swo',
  \  '.DS_Store', '*.plist',
  \  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
  \  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
  \  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
  \]
endfunction
