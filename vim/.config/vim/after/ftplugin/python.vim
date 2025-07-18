"===============================================================================
" ┏━┓╻ ╻╺┳╸╻ ╻┏━┓┏┓╻
" ┣━┛┗┳┛ ┃ ┣━┫┃ ┃┃┗┫
" ╹   ╹  ╹ ╹ ╹┗━┛╹ ╹
"===============================================================================

"===============================================================================
" Configuration
"===============================================================================

" Text wrapping
setlocal nowrap

" Set vertical column
set colorcolumn=81

" Indentation
setlocal autoindent
setlocal smartindent

setlocal expandtab
setlocal softtabstop=4
setlocal shiftwidth=4

" Code folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Configure 'black'
setlocal formatprg=black\ -\ -q\ 2>/dev/null

"===============================================================================
" Commands
"===============================================================================

"===============================================================================
" Auto-commands
"===============================================================================

autocmd Filetype python nnoremap <buffer> <F9> :update<bar>!python %<CR>
augroup black-fmt
    autocmd!
    autocmd bufwritepre *.py :normal mfgggqG`f
augroup END
