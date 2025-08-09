"--------------------------------------------------------------------------------
"     File Name     : statusline.vim
"     Created By    : Alexander
"     Creation Date : [2025-04-02 19:17]
"     Last Modified : [2025-08-09 15:10]
"     Description   : Status line configuration
"--------------------------------------------------------------------------------

"===============================================================================
" FUNCTIONS
"===============================================================================

"-------------------------------------------------------------------------------
"
function! StatuslineGit()
  if !exists('b:git_branch')
    let b:git_branch = ''
    let status = system('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    if v:shell_error == 0
      let b:git_branch = substitute(status, '\n', '', 'g')
    endif
  endif
  return b:git_branch != '' ? '['.b:git_branch.']' : '¬'
endfunction

"===============================================================================
" CONFIGURATION
"===============================================================================
" Always show the status line
set laststatus=2

" Configure status line
set statusline=
set statusline+=%#DiffChange#
set statusline+=%{HasPaste()}
set statusline+=%{StatuslineGit()}
set statusline+=%#DiffText#
set statusline+=\ %f\ %m
set statusline+=%#CursorColumn#
set statusline+=%=
set statusline+=%#DiffAdd#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %l:%c
set statusline+=\ (%p%%\)

