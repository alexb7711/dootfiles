"--------------------------------------------------------------------------------
"     File Name     : netrw.vim
"     Created By    : Alexander
"     Creation Date : [2025-06-14 12:14]
"     Last Modified : [2025-06-14 12:27]
"     Description   : NetRW Configuration
"--------------------------------------------------------------------------------

""==============================================================================
" Keybindings
""==============================================================================

noremap <buffer> <C-r> Nop
nnoremap <buffer> <C-r> <C-l>

noremap <buffer> <C-l> Nop
nnoremap <buffer> <C-l> <C-w>l


""==============================================================================
" AUTO COMMANDS
""==============================================================================
augroup netrw-commands
  autocmd!
  autocmd bufenter Netrw* set nonumber norelativenumber
augroup END
