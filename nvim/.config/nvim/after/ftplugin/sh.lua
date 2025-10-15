-- =============================================================================
-- ┏━┓╻ ╻┏━╸╻  ╻
-- ┗━┓┣━┫┣╸ ┃  ┃
-- ┗━┛╹ ╹┗━╸┗━╸┗━╸
-- =============================================================================

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
