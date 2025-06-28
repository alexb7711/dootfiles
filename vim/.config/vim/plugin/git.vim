"--------------------------------------------------------------------------------
"     File Name     : git.vim
"     Created By    : Alexander
"     Creation Date : [2025-04-25 18:51]
"     Last Modified : [2025-04-29 18:53]
"     Description   : Be able to run git commands within vim easily
"--------------------------------------------------------------------------------

"===============================================================================
" FUNCTIONS
"===============================================================================
" Define a function to execute Git commands
function! GitExecute(cmd, ...)
  if a:0 < 1 && a:cmd != "status"
    execute 'silent !git ' . a:cmd
  elseif a:0 < 1 && a:cmd == "status"
    execute '!git ' . a:cmd
  elseif a:0 == 1
    execute 'silent !git ' . a:cmd . ' "' . a:1 . '"'
  endif
  redraw!
endfunction

"===============================================================================
" COMMANDS
"===============================================================================

" Define a command to stage all changes
command! GitStage call GitExecute('add .')
command! GitAdd call GitExecute('add ' . expand('%:p'))

" Display status
command! GitStatus call GitExecute('status')

" Define a command to commit staged changes
command! -nargs=1 GitCommit call GitExecute('commit -m', <args>)

" Define a command to commit checks out branches and commits
command! -nargs=1 GitCheckout call GitExecute('checkout', <q-args>)

" Define a command to push changes to remote repository
command! GitPush call GitExecute('push origin HEAD')

" Define a command to pull changes from remote repository
command! GitPull call GitExecute('pull origin HEAD')

" Define a command to log changes
command! GitLog call GitExecute('log')
command! GitTree call GitExecute('lg1')

" Define a command to reset changes
command! GitResetHard call GitExecute('reset --hard')
command! GitReset call GitExecute('reset')

"===============================================================================
" Mapping
"===============================================================================

nnoremap <leader>g<leader> :GitStage<CR>
nnoremap <leader>g. :GitAdd<CR>
nnoremap <leader>gs :GitStatus<CR>
nnoremap <leader>gc :GitCommit<space>
nnoremap <leader>gC :GitCheckout<space>
nnoremap <leader>gP :GitPush<CR>
nnoremap <leader>gp :GitPull<CR>
nnoremap <leader>gl :GitLog<CR>
nnoremap <leader>gL :GitTree<CR>
nnoremap <leader>grR :GitResetHard<CR>
nnoremap <leader>grr :GitReset<CR>
