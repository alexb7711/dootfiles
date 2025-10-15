-- =============================================================================
-- ┏━╸┏━╸┏┓╻┏━╸┏━┓┏━┓╻     ┏━╸┏━┓┏┓╻┏━╸╻┏━╸╻ ╻┏━┓┏━┓╺┳╸╻┏━┓┏┓╻
-- ┃╺┓┣╸ ┃┗┫┣╸ ┣┳┛┣━┫┃     ┃  ┃ ┃┃┗┫┣╸ ┃┃╺┓┃ ┃┣┳┛┣━┫ ┃ ┃┃ ┃┃┗┫
-- ┗━┛┗━╸╹ ╹┗━╸╹┗╸╹ ╹┗━╸   ┗━╸┗━┛╹ ╹╹  ╹┗━┛┗━┛╹┗╸╹ ╹ ╹ ╹┗━┛╹ ╹
-- =============================================================================

require("util.functions")

-- =============================================================================
-- CONFIGURATION
-- =============================================================================

-- -----------------------------------------------------------------------------
-- => General
-- -----------------------------------------------------------------------------

-- Don't try to be compatible with Vi
vim.opt.compatible = false

-- Keep more history
vim.opt.history = 1000

-- Enable file type plugins
vim.api.nvim_command('filetype plugin indent on')

-- Auto read files that were externally modified
vim.opt.autoread = true

-- Set text encoding
vim.opt.encoding = 'utf8'

-- Leader Key
--" Clear space of any mapping
vim.keymap.set('n', '<SPACE>', '<Nop>')
vim.g.mapleader      = " "
vim.b.maplocalleader = " "

-- Saving options in session and view files causes more problems than it
-- solves, so disable it.
vim.opt.sessionoptions:remove('options')
vim.opt.viewoptions:remove('options')

-- -----------------------------------------------------------------------------
-- => VIM user interface
-- -----------------------------------------------------------------------------

-- Scrolling
vim.opt.scrolloff=5
vim.opt.sidescroll=1
vim.opt.sidescrolloff=2

-- Command Completion
vim.opt.wildmenu = true
vim.opt.wildignore={'*.o', '*~', '*.pyc'}

vim.opt.wildmode="lastused:full"
vim.opt.wildoptions={'pum', 'fuzzy'}
vim.opt.wildignore = vim.opt.wildignore + {'*/venv/*', '*/.venv/*', '*/.git/*', '*/hg/*', '*/.svn/*', '*/__pycache__/*', '*/build/*'}

-- Display cursor position
vim.opt.ruler = true

-- Cursor line
vim.opt.cursorline = true

-- A buffer becomes hidden when it is abandoned
vim.opt.hid = true

-- Make sure backspace does the right thing
vim.opt.backspace= {'indent', 'eol', 'start'}

-- Searching
vim.opt.path = vim.opt.path + {'**'}
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Lazy Redraw -- don't try to redraw when executing a macro
vim.opt.lazyredraw = true

-- Highlight connecting brackets
vim.opt.showmatch = true

-- Disable sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.timeoutlen = 500

-- Spellcheck
vim.opt.spell = true

-- Show commands
vim.opt.showcmd = true

-- Vertical Bar
vim.opt.colorcolumn = "81"

-- Add a bit extra margin to the left
vim.opt.foldcolumn = "1"

-- Enable Mouse support
vim.opt.mouse = "nvi"

-- Display long lines
vim.opt.display = 'truncate'

-- Show Whitespace
-- https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
vim.opt.listchars = {
  eol = '¬',         -- End of line
  tab = '▸ ',        -- Tab (requires two characters)
  extends = '»',     -- Character shown when a line extends beyond the window
  precedes = '«',    -- Character shown when a line precedes the window
  trail = '·',       -- Trailing spaces
  nbsp = '+',        -- Non-breaking spaces
}
vim.opt.list = true

-- Rational window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Round floating windows
vim.opt.winborder = 'double'

------------------------------------------------------------------------------
-- => Files, backups and undo
-- ------------------------------------------------------------------------------

-- Turn backup off, since most stuff is in SVN, git etc. anyway...
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Save undo history
vim.opt.undofile = true

-- ------------------------------------------------------------------------------
-- => Text, tab and indent related
-- ------------------------------------------------------------------------------

-- Use spaces instead of tabs and automatically detect indentation amount
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Indenting
vim.opt.wrap = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- ------------------------------------------------------------------------------
-- => Completion
-- ------------------------------------------------------------------------------

-- Completion
vim.opt.omnifunc = "syntaxcomplete#Complete"

-- Enable the clipboard
vim.opt.clipboard = "unnamedplus"

-- Commenting
vim.opt.formatoptions = vim.opt.formatoptions + {"j"}

-- Completion Menu
--" Avoid showing message extra message when using completion
vim.opt.shortmess = "filnxtToOFcI"

-- Completion
-- - -i: Disable completing keywords in include files. This can be really slow
-- vim.opt.complete.remove('i')

--" Set completeopt to have a better completion experience
vim.opt.completeopt= {'fuzzy', 'menu', 'menuone', 'noinsert', 'popup'}

-- Suffixes (gf)
vim.opt.suffixesadd = {'.c', '.cpp', '.h', '.hpp', '.m', '.markdown', '.md', '.py'}

-- ------------------------------------------------------------------------------
-- => Code folding
-- ------------------------------------------------------------------------------

--" By default, don't fold
vim.opt.foldenable = false

--" Default fold method to indent
vim.opt.foldmethod = "indent"

--" The maximum amount of times a fold can nest
vim.opt.foldnestmax = 8
