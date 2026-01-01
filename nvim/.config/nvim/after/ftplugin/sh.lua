-- =============================================================================
-- ┏━┓╻ ╻┏━╸╻  ╻
-- ┗━┓┣━┫┣╸ ┃  ┃
-- ┗━┛╹ ╹┗━╸┗━╸┗━╸
-- =============================================================================

-- Indentation
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 3
vim.opt_local.shiftwidth = 3


-- Make the script executable
local sh_augroup = vim.api.nvim_create_augroup("ShellGroup", { clear = true })
vim.api.nvim_create_autocmd({"FileWritePre"}, {
   group = sh_augroup,
   pattern = {"sh"},
   callback = function()
      vim.opt_local.cursorline = true
      vim.fn.system("chmod +x " .. vim.fn.expand("%"))
   end
})
