-- =============================================================================
-- ┏━┓╻ ╻╺┳╸╻ ╻┏━┓┏┓╻
-- ┣━┛┗┳┛ ┃ ┣━┫┃ ┃┃┗┫
-- ╹   ╹  ╹ ╹ ╹┗━┛╹ ╹
-- =============================================================================

require("util.functions")

-- =============================================================================
-- Functions
-- =============================================================================
function PythonFormatBuffer()
   -- Check if python black should be ran
   local config_found = search_in_file("pyproject.toml", "[tool.black]")
   if config_found then
      -- Format the buffer
      local cursor_pos = vim.fn.getpos('.')
      vim.fn.system("black -q " .. vim.fn.expand("%"))
      vim.fn.setpos('.', cursor_pos)
      vim.cmd('edit') -- Reread the file
   end
end

-- =============================================================================
-- Configuration
-- =============================================================================

-- Text wrapping
vim.opt_local.wrap = false

-- Set vertical column
vim.opt_local.colorcolumn = "90"

-- Indentation
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

-- Code folding
vim.opt_local.foldmethod = "indent"
vim.opt_local.foldlevel = 99

-- Configure 'black'
vim.opt_local.formatprg = "black - -q 2>/dev/null"

-- =============================================================================
-- Commands
-- =============================================================================

-- =============================================================================
-- Auto-commands
-- =============================================================================

local python_augroup = vim.api.nvim_create_augroup("PythonGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
   group = python_augroup,
   pattern = { "*.py" },
   callback = PythonFormatBuffer,
})
