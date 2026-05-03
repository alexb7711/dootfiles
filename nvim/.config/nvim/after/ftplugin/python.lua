-- =============================================================================
-- ┏━┓╻ ╻╺┳╸╻ ╻┏━┓┏┓╻
-- ┣━┛┗┳┛ ┃ ┣━┫┃ ┃┃┗┫
-- ╹   ╹  ╹ ╹ ╹┗━┛╹ ╹
-- =============================================================================

require("util.functions")

-- =============================================================================
-- Functions
-- =============================================================================

--------------------------------------------------------------------------------
-- Automatically format python buffer
function PythonFormatBuffer()
  local pyproject = vim.fn.findfile("pyproject.toml", ".;")

  if pyproject == "" then
    return
  end

  local lines = vim.fn.readfile(pyproject)
  local has_black = false

  for _, line in ipairs(lines) do
    if line:match("%[tool%.black%]") then
      has_black = true
      break
    end
  end

  if not has_black then
    return
  end

  local file = vim.fn.expand("%:p")
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  vim.system({ "black", "-q", file }, { text = true }, function(result)
    if result.code == 0 then
      vim.schedule(function()
        vim.cmd("checktime") -- reload only if file changed
        vim.api.nvim_win_set_cursor(0, cursor_pos)
      end)
    else
      vim.schedule(function()
        vim.notify("Black formatting failed", vim.log.levels.ERROR)
      end)
    end
  end)
end

--------------------------------------------------------------------------------
-- Manually format Python buffer
local function format_with_black()
   local file = vim.api.nvim_buf_get_name(0)

   if file == "" then
      vim.notify("[Black] No file to format", vim.log.levels.WARN)
      return
   end

   if vim.bo.modified then
      vim.cmd.write()
   end

   vim.system({ "black", file }, { text = true }, function(result)
      vim.schedule(function()
         if result.code == 0 then
            vim.cmd("edit!")
            vim.notify("[Black] Formatting complete")
         else
            vim.notify("[Black] " .. (result.stderr or "Failed"), vim.log.levels.ERROR)
         end
      end)
   end)
end

-- =============================================================================
-- Configuration
-- =============================================================================

-- Text wrapping
vim.opt_local.wrap = false

-- Set vertical column
-- vim.opt_local.colorcolumn = "90"
vim.opt_local.colorcolumn = {79, 99}

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

vim.api.nvim_create_user_command("Black", format_with_black, {})
vim.keymap.set("n", "<leader>Fb", format_with_black, { desc = "Format with Black" })

-- =============================================================================
-- Auto-commands
-- =============================================================================

local python_augroup = vim.api.nvim_create_augroup("PythonGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
   group = python_augroup,
   pattern = { "*.py" },
   callback = PythonFormatBuffer,
})
