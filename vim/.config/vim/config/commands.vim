"==============================================================================="
" COMMANDS
"==============================================================================="
" Ctags
command! MakeTags !ctags -R .

" Open Vimrc
command! Vimrc :vs $MYVIMRC

command! CenterPane call CenterPane()

" Reformat text
map <F7> gg=G<C-o><C-o>

" From `:help :DiffOrig`.
if exists(":DiffOrig") != 2
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
        \ | diffthis | wincmd p | diffthis
endif

"==============================================================================="
" AUTO COMMANDS
"==============================================================================="
" Auto Save When Leaving Buffer
autocmd BufLeave * silent! wall

" Cursor line
" In case there is an underline in the highlight
augroup CursorLine
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup END

" Disable Word Wrap
autocmd BufEnter,FocusGained,InsertLeave *.cpp,*.c,*.h,*.hpp,*.vim set nowrap

" Reload Document when window gains focus
autocmd FocusGained,BufEnter * :silent! !

" Sets numbering style on the left hand side
autocmd InsertLeave,BufEnter * setlocal relativenumber | setlocal number
autocmd InsertEnter * setlocal norelativenumber | setlocal number

"" Disable for terminal mode
autocmd TerminalOpen, * set nonumber norelativenumber
autocmd BufEnter,BufLeave,FocusGained,FocusLost term://*,*.pdf set nonumber norelativenumber

" Create file headers
augroup auto_header
  autocmd!
  autocmd bufnewfile *.vim :Autoheader
  autocmd bufwritepre,filewritepre *.vim :AutoheaderUpdate
augroup END

" Delete trailing white space
exec "autocmd FileType " . join(g:prog_file, ",") . " autocmd BufWritePre <buffer> :call DeleteTrailingSpaces()"

" Automatically reload the buffer if it was changed outside of Vim
autocmd FocusGained,BufEnter * silent! checktime
