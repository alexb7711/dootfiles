-- =============================================================================
-- ┏┓╻┏━╸╺┳╸┏━┓╻ ╻
-- ┃┗┫┣╸  ┃ ┣┳┛┃╻┃
-- ╹ ╹┗━╸ ╹ ╹┗╸┗┻┛
-- =============================================================================

--"=============================================================================
-- Configuration
--"=============================================================================
vim.opt_local.number = false -- Disable line numbers
vim.opt_local.relativenumber = false -- Disable line numbers

vim.g.netrw_keepdir = 0 -- Sync PWD with browsing directory

-- Highlight marked files
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search" }) 
--
--"=============================================================================
-- Keybindings
--"=============================================================================

vim.keymap.set('n', '<C-r>', 'Nop', {buffer = true})
vim.keymap.set('n', '<C-r>', '<C-l>', {buffer = true})

vim.keymap.set('n', '<C-l>', 'Nop', {buffer = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {buffer = true})

