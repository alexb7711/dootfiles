-- =============================================================================
-- ╻  ┏━┓╺┳╸┏━╸╻ ╻
-- ┃  ┣━┫ ┃ ┣╸ ┏╋┛
-- ┗━╸╹ ╹ ╹ ┗━╸╹ ╹
-- =============================================================================
return {
   cmd = { 'texlab' },
   filetypes = { 'tex', 'plaintex', 'bib' },

   settings = {
      texlab = {
         build = {
            executable = 'latexmk',
            args = {
               '-pdf',
               '-interaction=nonstopmode',
               '-synctex=1',
               '%f',
            },
            onSave = true,
         },
         chktex = {
            onOpenAndSave = true,
            onEdit = false,
         },
         diagnosticsDelay = 300,
      },
   },
}
