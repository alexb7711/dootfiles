-- =============================================================================
-- ┏━┓╻  ┏━┓┏┓╻╺┳╸╻ ╻┏┳┓╻
-- ┣━┛┃  ┣━┫┃┗┫ ┃ ┃ ┃┃┃┃┃
-- ╹  ┗━╸╹ ╹╹ ╹ ╹ ┗━┛╹ ╹┗━╸
-- =============================================================================

return {
   {
      "aklt/plantuml-syntax",
      init = function()
         vim.g.plantuml_set_makeprg = 0
      end,
   },
   {
      'https://gitlab.com/itaranto/preview.nvim',
      version = '*',
      opts = {
         previewers_by_ft = {
            -- markdown = {
            --    name = 'pandoc_wkhtmltopdf',
            --    renderer = { type = 'command', opts = { cmd = { 'zathura' } } },
            -- },
            -- plantuml = {
               -- name = 'plantuml_text',
               -- renderer = { type = 'buffer', opts = { split_cmd = 'vsplit' } },
            -- },
            plantuml = {
               name = 'plantuml_png',
               renderer = { type = 'command', opts = { cmd = { 'feh' } } },
            },
            groff = {
               name = 'groff_ms_pdf',
               renderer = { type = 'command', opts = { cmd = { 'zathura' } } },
            },
         },
         previewers = {
            plantuml_png = {
               args = { '-pipe', '-tpng' },
            },
         },
         render_on_write = true,
      },
   },
}
