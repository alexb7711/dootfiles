-- =============================================================================
-- ╺┳╸┏━┓┏━╸┏━╸┏━┓╻╺┳╸╺┳╸┏━╸┏━┓
--  ┃ ┣┳┛┣╸ ┣╸ ┗━┓┃ ┃  ┃ ┣╸ ┣┳┛
--  ╹ ╹┗╸┗━╸┗━╸┗━┛╹ ╹  ╹ ┗━╸╹┗╸
-- =============================================================================

return {
   "nvim-treesitter/nvim-treesitter",
   branch = "main",
   build = ":TSUpdate",
   lazy = false,
   init = function()
      -- Manually install the parsers
      require('nvim-treesitter').install({
         "c", "cpp", "lua", "vim", "vimdoc", "python", "css", "html"
      })
   end,
   config = function()
      require('util.buf_types')
      local t = require("nvim-treesitter.config")

      t.setup({
         sync_install = false,
         auto_install = true, -- Automatically install languages that is not in the list

         highlight = { enable = true },
         indent = { enable = true },
      })
   end
}
