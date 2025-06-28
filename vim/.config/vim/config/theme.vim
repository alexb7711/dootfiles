"--------------------------------------------------------------------------------
"     File Name     : config/theme.vim
"     Created By    : Alexander
"     Creation Date : [2025-03-22 19:51]
"     Last Modified : [2025-06-12 12:19]
"     Description   : Configure the theme
"--------------------------------------------------------------------------------

"==============================================================================="

" ╺┳╸╻ ╻┏━╸┏┳┓┏━╸
"  ┃ ┣━┫┣╸ ┃┃┃┣╸
"  ╹ ╹ ╹┗━╸╹ ╹┗━╸
"==============================================================================="

" Turn on terminal/gui (syntax) colors
set termguicolors

if &t_Co > 1
  syntax enable
endif

"Color Scheme Settings
set background=dark

try
  colorscheme elflord
catch /^Vim\%((\a\+)\)\=:E/
  colorscheme elflord
endtry

hi cursorline term=bold cterm=bold
