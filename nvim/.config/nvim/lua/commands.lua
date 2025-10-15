require("util.buf_types")
require("util.functions")

-- =============================================================================
-- Commands
-- =============================================================================

-- Trim White space
vim.api.nvim_create_user_command('Trim', whitespace_trim, {})

-- Edit Neovim Configuration
vim.api.nvim_create_user_command('Vimrc', "edit $MYVIMRC", {})

-- =============================================================================
-- Auto Commands
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Auto save when leaving a buffer
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufLeave", {
   pattern = { "*" },
   callback = function()
      vim.cmd("wall")
   end
})

-- -----------------------------------------------------------------------------
-- Cursorline
-- -----------------------------------------------------------------------------
local cursor_line_augroup = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({"InsertLeave", "WinEnter"}, {
   group = cursor_line_augroup,
   pattern = {"*"},
   callback = function()
      vim.opt_local.cursorline = true
   end
})
vim.api.nvim_create_autocmd({"InsertEnter", "WinLeave"}, {
   group = cursor_line_augroup,
   pattern = {"*"},
   callback = function()
      vim.opt_local.cursorline = false
   end
})

-- -----------------------------------------------------------------------------
-- Disable Word Wrap
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {
   pattern = ProgBuf,
   callback = function()
      vim.opt_local.wrap = false
   end
})

-- -----------------------------------------------------------------------------
-- Line Numbers
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd({"UIEnter", "InsertLeave"}, {
   pattern = {'*'},
   callback = function()
      if lhas(ProgFileType, vim.bo.filetype) then
         vim.opt_local.number = true
         vim.opt_local.relativenumber = true
      end
   end
})
vim.api.nvim_create_autocmd({"InsertEnter"}, {
   pattern = {'*'},
   callback = function()
      print(vim.bo.filetype)
      if lhas(ProgFileType, vim.bo.filetype) then
         vim.opt_local.number = true
         vim.opt_local.relativenumber = false
      end
   end
})

-- -----------------------------------------------------------------------------
-- Disable for terminal mode
-- -----------------------------------------------------------------------------
local term_augroup = vim.api.nvim_create_augroup("TermGroup", {clear = true})
vim.api.nvim_create_autocmd ("TermOpen", {
   group = term_augroup,
   pattern = {"*"},
   callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
   end
})
vim.api.nvim_create_autocmd ({"BufEnter", "BufLeave", "FocusGained", "FocusLost"}, {
   group = term_augroup,
   pattern = {"term://*,*.pdf"},
   callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
   end
})
