-- =============================================================================
-- ╻  ┏━┓┏━┓
-- ┃  ┗━┓┣━┛
-- ┗━╸┗━┛╹
-- =============================================================================

-- -----------------------------------------------------------------------------
-- LSP Supported Languages
-- -----------------------------------------------------------------------------
vim.lsp.enable({
   'cc',
   'python',
   'lua',
   'bash',
})

-- -----------------------------------------------------------------------------
-- LSP Configuration
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('lsp_group', {}),
   callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

      -- Set up a default configuration
      vim.lsp.config('*', {
         root_markers = { '.git' },
      })

      -- Auto-format ("lint") on save.
      -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
      if not client:supports_method('textDocument/willSaveWaitUntil')
         and client:supports_method('textDocument/formatting') then
         vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
            buffer = args.buf,
            callback = function()
               vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
         })
      end
   end,
})

-- -----------------------------------------------------------------------------
-- LSP Diagnostics
-- -----------------------------------------------------------------------------
vim.diagnostic.config({
   virtual_lines = {
      current_line = true,
   },
})
