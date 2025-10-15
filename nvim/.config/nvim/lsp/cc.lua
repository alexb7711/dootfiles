-- =============================================================================
-- ┏━╸ ╻┏━╸ ╻  ╻
-- ┃  ┏┛┃  ╺╋╸╺╋╸
-- ┗━╸╹ ┗━╸ ╹  ╹
-- =============================================================================

return {
   cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
      -- "--fallback-style=mozilla",
   },
   filetypes = {'c', 'cpp'},
   root_markers = { ".git", "Makefile", "CMakeLists.txt" },
   workspace_required = true,
}
