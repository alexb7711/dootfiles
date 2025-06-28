"--------------------------------------------------------------------------------
"     File Name     : project.vim
"     Created By    : Alexander
"     Creation Date : [2025-03-22 19:11]
"     Last Modified : [2025-06-12 11:28]
"     Description   : Tools to assist while working in projects
"--------------------------------------------------------------------------------
if exists('g:auto_plugin')
  finish
endif
"===============================================================================
" VARIABLES
"===============================================================================

" Project directory
let g:project_dir = $HOME . '/code/'

"===============================================================================
" PRIVATE FUNCTIONS
"===============================================================================

"-------------------------------------------------------------------------------
" Determine if the file may a file type associated with a git repository
function! s:MayBeProject()
  if (&filetype == "c" || &filetype == "cmake" || &filetype == "make" ||
        \ &filetype == "markdown" || &filetype == "rust" || &filetype == "tex" ||
        \ &filetype == "toml" || &filetype == "vim" || &filetype == "yaml" ||
        \ &filetype == 'cpp' || &filetype == 'css' || &filetype == 'html' ||
        \ &filetype == 'java' || &filetype == 'javascript' || &filetype == 'json' ||
        \ &filetype == 'python' || &filetype == 'xml')
    return 1
  endif
  return 0
endfunction

"-------------------------------------------------------------------------------
" Determine if file type is supported by `ctags`
function! s:CtagSupport()
  if (&filetype == "c" || &filetype == "cpp" || &filetype == "rust" ||
        \ &filetype == 'java' || &filetype == 'javascript' || &filetype == 'python')
    return 1
  endif
  return 0
endfunction

"-------------------------------------------------------------------------------
" `:command-completion-custom`
function! s:FindFile(ArgLead, CmdLine, CursorPos)
  if (WhichEnv() =~# 'WINDOWS')
    let s:fnd_cmd = 'Get-ChildItem -Path . -Recurse -File -Filter '
  else
    let s:fnd_cmd = 'find . -type f -name '
  endif

  " Default argument is to search everything
  let s:fn = '"*"'

  " If no argument was provided and the buffer has a certain file type
  if a:ArgLead == '' && expand('%:e') != ''
    "" Search for other files of that type
    let s:fn = '"*.' . expand('%:e') . '"'
  " Else if a search argument was provided
  elseif a:ArgLead != ''
    "" Do a fuzzy search for that argument
    let s:fn = '"' . a:ArgLead . '*"'
  endif

  " Return a Vim list of the results
  return split(glob("`" . s:fnd_cmd . s:fn . "`"))
endfunction

"===============================================================================
" PUBLIC FUNCTIONS
"===============================================================================

"-------------------------------------------------------------------------------
"
function! project#FindProjectRoot() abort
  execute ':lcd %:p:h'
  let l:isgit = system('git rev-parse --is-inside-work-tree 2>/dev/null')
  if v:shell_error == 0
    let l:path = system('git rev-parse --show-toplevel 2>/dev/null')
    execute ':lcd ' . l:path
    execute ':pwd'
  else
    echo "You're not in a git directory."
  endif
endfunction

"-------------------------------------------------------------------------------
" Run `ctags` recursively from `pwd`
function! project#CreateTags(ft)
  " If `ctags` are not supported, exit early
  if s:CtagSupport() == 0
    return
  endif

  let flags=""
  call system('ctags' . flags . ' -R .')
endfunction

"-------------------------------------------------------------------------------
" Function to list all projects
function! project#ListProjects(ArgLead, CmdLine, CursorPos)
  if (WhichEnv() =~# 'WINDOWS')
    let projects = split(system('Get-ChildItem -Path ' . g:project_dir . ' -Recurse -Directory -Filter "' . a:ArgLead . '*/.git"'), '\n')
  else
    let projects = split(system('find ' . g:project_dir . ' -type d -iwholename "*' . a:ArgLead . '*/.git"'), '\n')
  endif

let projects_updated = []
  for p in projects
    let projects_updated += [substitute(p, '\.git', '', 'g')]
  endfor

  return projects_updated
endfunction

"===============================================================================
" COMMANDS
"===============================================================================
command FindRoot call project#FindProjectRoot()
command CreateTags call project#CreateTags(&ft)

command! -nargs=1 -bang -complete=custom,project#ListProjects ProjectList edit<bang> <args> | cd <args>
command! -nargs=1 -bang -complete=customlist,s:FindFile ProjectSearch find<bang> <args>

"===============================================================================
" AUTO COMMANDS
"===============================================================================
augroup project
  autocmd bufreadpost,bufenter * silent! call project#FindProjectRoot()
  autocmd bufwritepost * silent! call project#CreateTags(&ft)
augroup END

"===============================================================================
" DEFAULT MAPPINGS
"===============================================================================
nnoremap <leader>pf :ProjectSearch<space>
nnoremap <leader>pp :ProjectList<space>

let g:auto_plugin = 1
