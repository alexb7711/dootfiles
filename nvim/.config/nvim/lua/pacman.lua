-- =============================================================================
-- ╻  ┏━┓╺━┓╻ ╻
-- ┃  ┣━┫┏━┛┗┳┛
-- ┗━╸╹ ╹┗━╸ ╹
-- =============================================================================

---------------------------------------------------------------------------------
-- CONFIGURE LAZY                                                              --
---------------------------------------------------------------------------------

-- Check if `lazy` is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If `lazy` is not installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
          "git", "clone", "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable", -- latest stable release
          lazypath,
    })
end

-- Append `lazy` to the load path
vim.opt.rtp:prepend(lazypath)

---------------------------------------------------------------------------------
-- INSTALL PACKAGES                                                            --
---------------------------------------------------------------------------------

-- Setup plugins
require("lazy").setup("plugins")
