"--------------------------------------------------------------------------------
"     File Name     : statusline.vim
"     Created By    : Alexander
"     Creation Date : [2025-04-02 19:17]
"     Last Modified : [2025-04-06 15:00]
"     Description   : Status line configuration
"--------------------------------------------------------------------------------

"===============================================================================
" FUNCTIONS
"===============================================================================

"-------------------------------------------------------------------------------
"
function! StatuslineGit()
  if has("windows")
    return
  endif

  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

"===============================================================================
" CONFIGURATION
"===============================================================================
" Always show the status line
set laststatus=2

" Configure status line
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{HasPaste()}
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %l:%c
set statusline+=\ (%p%%\)

