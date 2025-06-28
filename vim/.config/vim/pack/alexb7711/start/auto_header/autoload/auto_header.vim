"===============================================================================
"
let s:style_list = [
      \    { 'style' : ['/*' , '*' , '*/' , '*' ] , 'ft' : [ 'c' , 'java' , 'cpp' , 'javascript' , 'go' , 'php' , 'jsp', 'rust' ] , 
      \      'prefix' : {
      \                 'php' : '<?php',
      \                 'jsp' : '<%',
      \                 },
      \      'appendix' : {
      \                 'php' : '?>',
      \                 'jsp' : '%>',
      \                 }},
      \    { 'style' : ['#'  , '#' , ''  , '#' ] , 'ft' : [ 'python' ,'python.django','ruby', 'perl' , 'sh','coffee' ] , 
      \      'prefix' : {
      \                 'python' : '#! /usr/bin/env python',
      \                 'ruby' : '#! /usr/bin/env ruby',
      \                 'perl' : '#! /usr/bin/env perl',
      \                 'sh' : '#! /bin/bash',
      \                   }},
      \    { 'style' : ['"'  , '"' , ''  , '-' ] , 'ft' : [ 'vim' , 'tex' ] },
      \    { 'style' : ['<!--'  , '*' , '-->'   , '*' ] , 'ft' : [ 'html' , 'md' ] },
      \    { 'style' : ['---[[' , ''  , '---]]' , ''  ]  , 'ft' : [ 'lua' ]},
      \]

"===============================================================================
"
function! s:insert_header_with_ft(ft)
  let auto_header_fill_char_repeat = &textwidth
  for styledict in s:style_list
    let ftlist = get(styledict, 'ft')
    let indexofft = index(ftlist, a:ft)

    if indexofft >= 0
      let style = get(styledict, 'style')
      let prefix = get(styledict, 'prefix')
      let appendix = get(styledict, 'appendix')
      let start_char = style[1]
      let start_line = 0

      let messages=[
            \ ['File Name', s:filename],
            \ ['Created By', g:auto_header_default_author],
            \ ['Creation Date', '[' . strftime('%Y-%m-%d %H:%M') . ']'],
            \ ['Last Modified', '[]'],
            \ ['Description', ' ']]

      " If the file type has a prefix banner at the top of the file
      " (i.e. '#!/bin/bash')
      if type(prefix) == type({})
        " Get the prefix
        let prefix_by_ft = get(prefix, a:ft)

        " Apply the prefix and move the start of the header
        " down one line
        if type(prefix_by_ft) == type('') && len(prefix_by_ft) > 0
          call append(0, prefix_by_ft)
          let start_line += 1
        endif
      endif

      " Start of comment block
      call append(start_line, style[0] . repeat(style[3], auto_header_fill_char_repeat))
      let start_line += 1

      for message in messages
        call append(start_line, start_char . repeat(' ', 5) . printf('%-14s: %s', get(message,0), get(message,1)))
        let start_line += 1
      endfor

      " Save cursor position
      let endline = start_line

      " End of comment block
      call append(start_line, start_char . repeat(style[3], auto_header_fill_char_repeat) . style[2])
      let start_line += 1

      " If the file type preamble has an associated closing
      " 'appendix'
      if type(appendix) == type({})
        let appendix_by_ft = get(appendix, a:ft)

        if type(appendix_by_ft) == type('') && len(appendix_by_ft)
          call append(start_line, appendix_by_ft)
        endif
      endif

      call append(start_line+1, '')

      " Restore line
      call cursor(endline, 0)
      exe "normal $"
      return 1
    endif
  endfor
  return 0
endfunction

"===============================================================================
"
function! auto_header#update_modified_time()
  let cursor_pos = getpos('.')
  silent! exe "1,9s/\\(Last Modified\\s\\+:\\s\\+\\)\\(\\[.*\\]\\)/\\1[" . strftime("%Y-%m-%d %H:%M") . "]/" 
  call setpos('.',cursor_pos)
endfunction

"===============================================================================
"
function! auto_header#make_header()
  let s:filename=expand('%:t')
  call s:insert_header_with_ft(&ft)
endfunction

"===============================================================================
"
function! auto_header#enable()
  augroup auto_header
    autocmd!
    autocmd bufnewfile *.* call auto_header#make_header()
    autocmd bufwritepre,filewritepre *.* call auto_header#Update_modified_time()
  augroup END
endfunction

"===============================================================================
"
function! auto_header#disable()
  augroup auto_header
    autocmd!
  augroup END
endfunction

