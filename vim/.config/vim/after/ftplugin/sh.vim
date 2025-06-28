"===============================================================================
" ┏━┓╻ ╻┏━╸╻  ╻
" ┗━┓┣━┫┣╸ ┃  ┃
" ┗━┛╹ ╹┗━╸┗━╸┗━╸
"===============================================================================

" Make the script executable
autocmd FileWritePre sh silent sh :!chmod +x %

" Load shellmenu.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_shellmenu') && findfile('plugin/shellmenu.vim', &rtp) ==# ''
  packadd! shellmenu
endif
