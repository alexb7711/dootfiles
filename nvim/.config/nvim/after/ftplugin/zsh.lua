-- =============================================================================
-- ╺━┓┏━┓╻ ╻
-- ┏━┛┗━┓┣━┫
-- ┗━╸┗━┛╹ ╹
-- =============================================================================

-- Make the script executable
local zsh_augroup = vim.api.nvim_create_augroup("ZshGroup", { clear = true })
vim.api.nvim_create_autocmd({"FileWritePre"}, {
   group = zsh_augroup,
   pattern = {"zsh"},
   callback = function()
      vim.opt_local.cursorline = true
      vim.fn.system("chmod +x " .. vim.fn.expand("%"))
   end
})
