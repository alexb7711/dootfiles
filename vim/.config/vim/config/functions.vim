"==============================================================================
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return '(PASTE)'
    endif
    return ''
endfunction

"==============================================================================
"
function! CenterPane()
   lefta vnew
   wincmd w
   exec 'vertical resize '. string(&columns * 0.75)
 endfunction

"==============================================================================
" Help with debugging
function! WriteToBuf(str)
  call setbufline(bufnr(bufname('')), 1, str)
endfunction

"==============================================================================
"
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"==============================================================================
" Delete trailing white space on save
function! DeleteTrailingSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

"==============================================================================
"
function! WhichEnv() abort
    if has('win64') || has('win32') || has('win16')
        return 'WINDOWS'
    else
       return toupper(substitute(system('uname'), '\n', '', ''))
    endif
endfunction

"==============================================================================
"
let t:is_transparent = 1 " 1 == transparent; 2 == solid
function! Toggle_transparent()
  if t:is_transparent == 0
    hi Normal guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    let t:is_transparent = 1
  else
    set background=dark
    let t:is_transparent = 0
  endif
endfunction
