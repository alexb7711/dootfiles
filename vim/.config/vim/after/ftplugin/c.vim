"--------------------------------------------------------------------------------
"     File Name     : c.vim
"     Created By    : Alexander
"     Creation Date : [2025-03-22 19:52]
"     Last Modified : [2025-08-03 11:31]
"     Description   : Configure C/C++ editing behavior
"--------------------------------------------------------------------------------
"===============================================================================

" ┏━╸ ╻┏━╸ ╻  ╻
" ┃  ┏┛┃  ╺╋╸╺╋╸
" ┗━╸╹ ┗━╸ ╹  ╹
"===============================================================================

"===============================================================================
" Functions
"===============================================================================
function CFormatBuffer()
  let format_file=findfile('.clang-format', expand('%:p:h') . ';')
  if !empty(format_file)
    let cursor_pos = getpos('.')
    :silent execute "silent !clang-format -style=file:" . format_file . " -i %"
    call setpos('.', cursor_pos)
  endif
endfunction

"===============================================================================
" Configuration
"===============================================================================

" Text wrapping
setlocal nowrap

" Indentation
setlocal nosmartindent

setlocal autoindent
set cindent
set cinoptions=b1(0,W4,m1
set cinkeys+=0=break

setlocal expandtab
setlocal softtabstop=3
setlocal shiftwidth=3

" Code folding
setlocal foldmethod=indent

" Formatting
setlocal formatprg=clang-format

"===============================================================================
" Commands
"===============================================================================

"===============================================================================
" Auto-commands
"===============================================================================

augroup custom_c
    autocmd!

    autocmd bufwritepost *.cpp,*.c,*.hpp,*.h :call CFormatBuffer()

    autocmd Filetype cpp,hpp nnoremap <buffer> <F9> :make<CR>
augroup END
