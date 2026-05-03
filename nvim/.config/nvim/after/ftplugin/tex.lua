-- =============================================================================
-- ╻  ┏━┓╺┳╸┏━╸╻ ╻
-- ┃  ┣━┫ ┃ ┣╸ ┏╋┛
-- ┗━╸╹ ╹ ╹ ┗━╸╹ ╹
-- =============================================================================

-- =============================================================================
-- Configuration
-- =============================================================================

-- Text wrapping
vim.opt_local.wrap = true

-- Code folding
vim.opt.foldmethod = "indent"

-- Indentation
vim.opt_local.smartindent = false

vim.opt_local.autoindent = true
vim.opt_local.cindent = true
vim.o.cinoptions = "b1(0,W4,m1"
vim.o.cinkeys = vim.o.cinkeys .. "0=break"

vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 3
vim.opt_local.shiftwidth = 3

-- Line length
vim.opt_local.textwidth = 0
