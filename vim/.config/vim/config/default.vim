"==============================================================================
" ┏━╸┏━╸┏┓╻┏━╸┏━┓┏━┓╻     ┏━╸┏━┓┏┓╻┏━╸╻┏━╸╻ ╻┏━┓┏━┓╺┳╸╻┏━┓┏┓╻
" ┃╺┓┣╸ ┃┗┫┣╸ ┣┳┛┣━┫┃     ┃  ┃ ┃┃┗┫┣╸ ┃┃╺┓┃ ┃┣┳┛┣━┫ ┃ ┃┃ ┃┃┗┫
" ┗━┛┗━╸╹ ╹┗━╸╹┗╸╹ ╹┗━╸   ┗━╸┗━┛╹ ╹╹  ╹┗━┛┗━┛╹┗╸╹ ╹ ╹ ╹┗━┛╹ ╹
"==============================================================================

"===============================================================================
" VARIABLES
"===============================================================================

let g:prog_file = ['c', 'cpp','cmake','make','markdown','rust','tex','toml','vim','yaml','cpp','css','html','java','javascript','json','python','xml']
let g:prog_buf = ['*.c', '*.h', '*.cpp', '*.hpp','CMakeLists.txt','makefile','*.md','*.rs','*.tex','*.toml','*.vim','*.yml','*.cpp','*.css','*.html','*.java','*.js','*.json','*.py','*.xml']
let g:doc_file = ['markdown', 'promela', 'tex']
let g:doc_buf = ['*.markdown', '*.md', '.pml', 'tex']
let g:vim_conf = $MYVIMRC

"===============================================================================
" CONFIGURATION
"===============================================================================

"-------------------------------------------------------------------------------
" => General
"-------------------------------------------------------------------------------

" Don't try to be compatible with Vi
set nocompatible

" Keep more history
set history=1000

" Enable file type plugins
filetype plugin indent on

" Auto read files that were externally modified-
set autoread

" Set text encoding
set encoding=utf8

" Leader Key
"" Clear space of any mapping
nnoremap <SPACE> <Nop>
let mapleader      = "\<space>"
let maplocalleader = "\<space>"

" Saving options in session and view files causes more problems than it
" solves, so disable it.
set sessionoptions-=options
set viewoptions-=options

"-------------------------------------------------------------------------------
" => VIM user interface
"-------------------------------------------------------------------------------

" Scrolling
set scrolloff=5
set sidescroll=1
set sidescrolloff=2

" Command Completion
set wildmenu
set wildignore=*.o,*~,*.pyc

if v:version > 800
  set wildmode=lastused:full
  set wildoptions=pum,fuzzy
else
  set wildmode=list:full,full
endif

"====================================
" TODO: Check if the check is needed
"====================================
" if (WhichEnv() =~# 'WINDOWS')
"   set wildignore +=.venv\*,.git\*,.hg\,.svn\*,__pycache__\*
" else
set wildignore +=*/.venv/*,*/.git/*,*./hg/*,*/.svn/*,*/__pycache__/*,*/build/*
" endif

" Display cursor position
set ruler

" Cursor line
set cursorline

" A buffer becomes hidden when it is abandoned
set hid

" Make sure backspace does the right thing
set backspace=indent,eol,start

" Searching
set path+=**
set incsearch
set ignorecase
set smartcase
set hlsearch!

" Correctly highlight $() and other modern affordances in filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix = 1
endif

" Lazy Redraw -- don't try to redraw when executing a macro
set lazyredraw

" Highlight connecting brackets
set showmatch

" Disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Spellcheck
set spell

" Show commands
set showcmd

" Vertical Bar
set colorcolumn=81

" Add a bit extra margin to the left
set foldcolumn=1

" Enable Mouse support
set mouse=a

" Display long lines
set display=truncate

" Show Whitespace
" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
set listchars=eol:\ ,tab:¦\ ,trail:~,extends:>,precedes:<
set list

" Rational window splitting
set splitbelow splitright

"-------------------------------------------------------------------------------
" => Files, backups and undo
"-------------------------------------------------------------------------------

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"-------------------------------------------------------------------------------
" => Text, tab and indent related
"-------------------------------------------------------------------------------

" Use spaces instead of tabs and automatically detect indentation amount
set expandtab
set smarttab

" Indenting
set wrap
set smartindent
set autoindent

"-------------------------------------------------------------------------------
" => Completion
"-------------------------------------------------------------------------------

" Completion
set omnifunc=syntaxcomplete#Complete

" Enable the clipboard
set clipboard=unnamed

" Commenting
set formatoptions+=j

" Completion Menu
"" Avoid showing message extra message when using completion
set shortmess+=c

" Completion
" - -i: Disable completing keywords in include files. This can be really slow
set complete-=i

"" Set completeopt to have a better completion experience
try
  set completeopt=fuzzy,menuone,noselect,preview
catch
  set completeopt=menuone,noselect,preview
endtry

" Suffixes (gf)
set suffixesadd=.c,.cpp,.h,.hpp,.m,.markdown,.md,.py


"-------------------------------------------------------------------------------
" => Code folding
"-------------------------------------------------------------------------------

"" By default, don't fold
set nofoldenable

"" Default fold method to indent
set foldmethod=indent

"" The maximum amount of times a fold can nest
set foldnestmax=8

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

"==============================================================================
" Load built-in plugins
"==============================================================================

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('pack/matchit.vim', &rtp) ==# ''
  packadd! matchit
endif

" Load comment.vim, but only if the user hasn't installed a newer version.
try
  if v:version > 800 && !exists('g:loaded_comment') && findfile('pack/comment.vim', &rtp) ==# ''
    packadd! comment
  endif
catch
endtry

" Load nohlsearch.vim, but only if the user hasn't installed a newer version.
try
  if v:version > 800 && !exists('g:loaded_nohlsearch') && findfile('plugin/nohlsearch.vim', &rtp) ==# ''
    packadd! nohlsearch
  endif
catch
endtry

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

