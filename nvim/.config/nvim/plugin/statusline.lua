-- =============================================================================
-- ┏━┓╺┳╸┏━┓╺┳╸╻ ╻┏━┓╻  ╻┏┓╻┏━╸
-- ┗━┓ ┃ ┣━┫ ┃ ┃ ┃┗━┓┃  ┃┃┗┫┣╸
-- ┗━┛ ╹ ╹ ╹ ╹ ┗━┛┗━┛┗━╸╹╹ ╹┗━╸
-- =============================================================================

-- =============================================================================
-- FUNCTIONS
-- =============================================================================

-- -----------------------------------------------------------------------------
--
function StatuslineGit()
   local git_branch = ''
   if vim.fn.exists('b:git_branch') ~= "" then
      local status = vim.fn.system('git rev-parse --abbrev-ref HEAD 2>/dev/null')
      if vim.v.shell_error == 0 then
         git_branch = vim.fn.substitute(status, '\n', '', 'g')
      end
   end
   return (git_branch ~= '' and '[' .. git_branch .. ']' or '¬' )
end

-- =============================================================================
-- Checks if past is set
function HasPaste()
   if vim.opt.paste:get() then
      return '  (PASTE)'
   else
      return ''
   end
end

-- =============================================================================
-- Construct the status line
function BuildStatusline()
   return table.concat{
      "%#SpellBad#",
      "%{luaeval('HasPaste()')}",
      "%#Title#",
      "%{luaeval('StatuslineGit()')}",
      "%#StatusLine#",
      " %f %m",
      "%#CursorColumn#",
      "%=",
      "%#WildMenu#",
      " %y",
      " %{&fileencoding?&fileencoding:&encoding}",
      " %l:%c",
      " (%p%%)",
   }
end

-- =============================================================================
-- CONFIGURATION
-- =============================================================================
vim.opt.laststatus = 2

vim.o.statusline = BuildStatusline()
