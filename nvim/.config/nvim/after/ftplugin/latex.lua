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

-- =============================================================================
-- Commands
-- =============================================================================

-- =============================================================================
-- Auto-commands
-- =============================================================================

autocmd bufwritepost *.tex silent !compile "%:p"
autocmd bufwritepost *.tex redraw!

local latex_augroup = vim.api.nvim_create_augroup("LatexGroup", { clear = true })
vim.api.nvim_create_autocmd({"BufWritePost"}, {
   group = latex_augroup,
   pattern = {"*.tex"},
   callback = function() 
      vim.fn.system("compile " .. vim.fn.expand("%:p")) 
      vim.cmd("redraw!")
   end,
})
