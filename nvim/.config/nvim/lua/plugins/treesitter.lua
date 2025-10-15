-- =============================================================================
-- ╺┳╸┏━┓┏━╸┏━╸┏━┓╻╺┳╸╺┳╸┏━╸┏━┓
--  ┃ ┣┳┛┣╸ ┣╸ ┗━┓┃ ┃  ┃ ┣╸ ┣┳┛
--  ╹ ╹┗╸┗━╸┗━╸┗━┛╹ ╹  ╹ ┗━╸╹┗╸
-- =============================================================================

return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   lazy = false,
   config = function()
      require('util.buf_types')
      local t = require("nvim-treesitter.configs")

      t.setup({
         ensure_installed = AllFileType,

         sync_install = false,
         auto_install = false, -- Automatically install languages that is not in the list

         highlight = { enable = true },
         indent = { enable = true },
      })
   end
}
