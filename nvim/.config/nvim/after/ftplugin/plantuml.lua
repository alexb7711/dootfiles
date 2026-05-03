-- =============================================================================
-- ┏━┓╻  ┏━┓┏┓╻╺┳╸┏┳┓╻ ╻┏┳┓╻
-- ┣━┛┃  ┣━┫┃┗┫ ┃ ┃┃┃┃ ┃┃┃┃┃
-- ╹  ┗━╸╹ ╹╹ ╹ ╹ ╹ ╹┗━┛╹ ╹┗━╸
-- =============================================================================

-- Indentation
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 3
vim.opt_local.shiftwidth = 3

-- Kepmaps
vim.keymap.set("n", "<space><space>", function()
  local current_file = vim.api.nvim_buf_get_name(0)
  local base = current_file:match("(.+)%..+")
  if not base then return end

  local pdf_file = base .. ".pdf"
  local png_file = base .. ".png"

  if vim.loop.fs_stat(pdf_file) then
    vim.cmd("!nohup zathura " .. vim.fn.shellescape(pdf_file) .. " >/dev/null 2>&1 &")
  elseif vim.loop.fs_stat(png_file) then
    vim.cmd("!nohup feh " .. vim.fn.shellescape(png_file) .. " >/dev/null 2>&1 &")
  else
    vim.notify("No corresponding .pdf or .png file found", vim.log.levels.WARN)
  end
end, { silent = true, buffer = true, desc = "Open .pdf with zathura or .png with feh" })
