"================================================================================
" Normal Keybindings
"================================================================================

nnoremap <leader><f1> :call Toggle_transparent()<CR>

"--------------------------------------------------------------------------------
" Auto Correct Spelling
autocmd BufEnter,FocusGained,InsertLeave *.md,*.markdown,*.tex nnoremap <silent> <leader><leader> ms[s1z=`s
autocmd BufEnter,FocusGained,InsertLeave *.puml,*.pml nnoremap <silent> <leader><leader> :vsplit<CR>:e %:r.utxt<CR>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader>s1 1z=

"--------------------------------------------------------------------------------
" Compile Hotkey
" Python
autocmd Filetype python nnoremap <buffer> <F9> :update<bar>!python %<CR>

" C/C++
autocmd Filetype c,h,cpp,hpp nnoremap <buffer> <F9> :make<CR>

" Compile script
exec "autocmd FileType " . join(g:doc_file, ",") . " nnoremap <buffer> <F9> :!compile \"%:p\"<CR> <pipe> :redraw!<CR>"

"--------------------------------------------------------------------------------
" Ignore long lines
noremap j gj
noremap k gk

"--------------------------------------------------------------------------------
" Go to the first character, not the beginning of the line
map 0 ^

"--------------------------------------------------------------------------------
" Open Complimenting C/H File
autocmd BufEnter,FocusGained,InsertLeave *.cpp,*.c nnoremap <silent> <leader><leader> :call OpenOther()<CR>

"--------------------------------------------------------------------------------
" Searching
exec 'autocmd FileType ' . join(g:prog_file, ',') . ' nnoremap <silent> <buffer> <leader>fw yiw:silent<space>grep!<space>-Ri<space>"<C-r>0"<space>.<CR>:botright cope<CR><C-l>'
exec 'autocmd FileType ' . join(g:prog_file, ',') . ' nnoremap <buffer> <leader>fs :silent grep!<space>-Ri<space>""<space>.<left><left><left>'

exec 'autocmd FileType ' . join(g:prog_file, ',') . ' nnoremap <buffer> <leader>pR :cfdo %s/original_string/new_string/g | write'

"-------------------------------------------------------------------------------
" Code Folding
"" Enable foldink:g
nnoremap <leader>,fe :set foldenable<CR>
nnoremap <leader>,fs :set nofoldenable<CR>

"--------------------------------------------------------------------------------
" Copy/Paste to clipboard
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P

"--------------------------------------------------------------------------------
" Open current pdf in zathura
nnoremap <silent> <leader>z :!zathura %:r.pdf&<CR>

"--------------------------------------------------------------------------------
" Reload Vim
nnoremap <leader>rv :source ~/.config/nvim/init.vim<CR>

"--------------------------------------------------------------------------------
" Rerun Macro
nnoremap Q @@

"--------------------------------------------------------------------------------
" Terminal
nnoremap <silent> <leader>ot :term<CR><C-W>J<C-W>:resize10<CR>

"--------------------------------------------------------------------------------
" Toggle Search Highlighting
nnoremap <F3> :set hlsearch!<CR>
nnoremap n nzz
nnoremap N Nzz

"--------------------------------------------------------------------------------
" WORKSPACE MANAGEMENT
"" Create window panes
nnoremap <leader>sv :vsplit<Enter>
nnoremap <leader>sh :split<Enter>

"" Change size of window panes
nnoremap <silent> <Up> <C-w>+
nnoremap <silent> <Down> <C-w>-
nnoremap <silent> <Right> <C-w><
nnoremap <silent> <Left> <C-w>>

"" Changing window pane
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

"" Create/Close/Duplicate Tabs
nnoremap <leader>tn :tabe<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tm :tabmove<space>
nnoremap <leader>td :let @" = expand("%")<CR>:tabe<CR>:e <C-r>"<CR>

"" Switch buffer directory to CWD
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"================================================================================
" Visual Keybindings
"================================================================================

" Copy/Paste to clipboard
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Parenthesis/bracket
" Map auto complete of (, ", ', [
vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>] <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>} <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>` <esc>`>a`<esc>`<i`<esc>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"================================================================================
" Command Line Mode Keybindings
"================================================================================
cmap <C-a> Nop

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
