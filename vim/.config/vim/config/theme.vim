"--------------------------------------------------------------------------------
"     File Name     : config/theme.vim
"     Created By    : Alexander
"     Creation Date : [2025-03-22 19:51]
"     Last Modified : [2025-07-20 09:32]
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
try
  colorscheme elflord
catch /^Vim\%((\a\+)\)\=:E/
  colorscheme elflord
endtry

" set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi Terminal guibg=NONE ctermbg=NONE
