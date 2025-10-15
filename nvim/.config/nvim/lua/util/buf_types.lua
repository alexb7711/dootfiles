-- =============================================================================
-- Programming Languages
-- =============================================================================
ProgBuf = {
   -- C/C++
  '*.c', '*.cpp',
  '*.h', '*.hpp',
  -- Rust 
  '*.rs',
  -- Interpreted Languages
  '*.lua', '*.vim',
  '*.m', '.oct',
  '*.py',
  '*.sh',
  -- Configuration and Serialization
  '*.toml', '*.yml', '*.json',
  -- Build tools
  'makefile', 'Makefile', '*.mk', '*.make',
  'CmakeLists.txt',
}

ProgFileType = {
   -- C/C++
   'c', 'cpp',
   -- Build tools
   'cmake', 'make',
   -- Rust
   'rust',
   -- Configuration and Serialization
   'toml', 'yaml', 'json',
   -- Interpreted Languages
   'vim', 'lua',
   'java', 'python',
   
   -- HTML
   'css','html','javascript','xml'
}

-- =============================================================================
-- PlantUML
-- =============================================================================
UmlBuf = {"*.pml"}
UmlFileType = {'promela'}

-- =============================================================================
-- Markup/Writing Languages
-- =============================================================================
DocBuf = {
  '*.md',
  '*.tex',
  '*.txt',
}

DocFileType= {
   'markdown',
   'tex'
}

-- =============================================================================
-- Combined
-- =============================================================================
AllFileType = vim.tbl_extend("keep", ProgFileType, DocFileType)
