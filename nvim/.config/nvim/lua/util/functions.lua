-- =============================================================================
-- This function checks if an item exists in a list
--
-- @param list List to be searched
-- @param item Item to search for
--
-- @return True if item is found, false otherwise
--
function lhas (list, item)
  for _, value in ipairs(list) do
    if value == item then return true end
  end
  return false
end

-- =============================================================================
-- This function trims whitespace from end of lines
--
function whitespace_trim()
   local save_cursor = vim.fn.getpos(".")
   vim.cmd([[keeppatterns %substitute/\v\s+$//eg]])
   vim.fn.setpos(".", save_cursor)
   vim.cmd('write')
end

-- =============================================================================
-- This function searches for a string in a file.
--
-- @param file_path Path to the file
-- @param search_string String to search for
--
-- @return True if `search_string` was found in `file_path`, false otherwise.
--
function search_in_file(file_path, search_string)
  -- Open the file
  local file = io.open(file_path, "r")
  if not file then
    print("Error: Could not open file " .. file_path)
    return
  end

  -- Read the file contents
  local file_contents = file:read("*a")
  file:close()

  -- Check if the search string is present in the file
  if file_contents:find(search_string) then
    return true
  else
    return false
  end
end
