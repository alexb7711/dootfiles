-- =============================================================================
-- ╻┏ ┏━╸╻ ╻┏┓ ╻┏┓╻╺┳┓╻┏┓╻┏━╸┏━┓
-- ┣┻┓┣╸ ┗┳┛┣┻┓┃┃┗┫ ┃┃┃┃┗┫┃╺┓┗━┓
-- ╹ ╹┗━╸ ╹ ┗━┛╹╹ ╹╺┻┛╹╹ ╹┗━┛┗━┛
-- =============================================================================

-- =============================================================================
-- Normal Keybindings
-- =============================================================================

-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- -----------------------------------------------------------------------------
-- Auto Correct Spelling

local spell_augroup = vim.api.nvim_create_augroup("SpellGroup", {clear = true})
vim.api.nvim_create_autocmd ({"BufEnter", "FocusGained", "InsertLeave"}, {
   group = spell_augroup,
   pattern = DocBuf,
   callback = function()
      vim.keymap.set('n', '<leader><leader>', "ms[s1z=`s",
      {noremap = true, silent = true})
   end
})
vim.api.nvim_create_autocmd ({"BufEnter", "FocusGained", "InsertLeave"}, {
   group = spell_augroup,
   pattern = UmlBuf,
   callback = function()
      vim.keymap.set('n', '<leader><leader>', ":vsplit<CR>:e %:r.utxt<CR>",
      {noremap = true, silent = true})
   end
})

-- Shortcuts using <leader>
vim.keymap.set('n', "<leader>sn", "]s", {silent = true})
vim.keymap.set('n',  "<leader>sp", "[s", {silent = true})
vim.keymap.set('n',  "<leader>sa", "zg", {silent = true})
vim.keymap.set('n',  "<leader>s?", "z=", {silent = true})
vim.keymap.set('n',  "<leader>s1", "1z=", {silent = true})

-- -------------------------------------------------------------------------------
-- Search/Replace
local search_augroup = vim.api.nvim_create_augroup("SearchGroup", {clear = true})
vim.api.nvim_create_autocmd ({"FileType"}, {
   desc = "Recursively search for the word under the cursor from `pwd`.",
   group = search_augroup,
   pattern = ProgFileType,
   callback = function()
      vim.keymap.set('n', '<leader>fw', 'yiw:silent<space>grep!<space>-i<space>"<C-r>0"<space>.<CR>:botright copen<CR><C-l>',
      {noremap = true, silent = true})
   end
})
vim.api.nvim_create_autocmd ({"FileType"}, {
   desc = "Search for `keyword` recursively from `pwd`.",
   group = search_augroup,
   pattern = ProgFileType,
   callback = function()
      vim.keymap.set('n', '<leader>fs', ':grep!<space>-i<space>""<space>.<left><left><left>',
      {noremap = true})
   end
})
vim.api.nvim_create_autocmd ({"FileType"}, {
   desc = "Relpace all instances of `original_string` with `new_string` in `quickfix`.",
   group = search_augroup,
   pattern = ProgFileType,
   callback = function()
      vim.keymap.set('n', '<leader>fR', ':cfdo %s/original_string/new_string/g | write',
      {noremap = true, silent = true})
   end
})

-- Center on search hits
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- -----------------------------------------------------------------------------
-- Code Folding
vim.keymap.set('n', "<leader>,fe", function() vim.opt.foldenable = true end, {silent = true})
vim.keymap.set('n', "<leader>,fs", function() vim.opt.foldenable = false end, {silent = true})

-- -----------------------------------------------------------------------------
-- Open current pdf in $PDF_READER
local pdf_augroup = vim.api.nvim_create_augroup("PDFGroup", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", {
   group = pdf_txt_augroup,
   pattern = { "*.pdf" },
   callback = function()
      vim.keymap.set('n', '<leader><leader>',
      function()
         vim.fn.system(vim.fn.getenv("PDF_READER") .. " '" .. vim.fn.expand("%:r") .. ".pdf'")
      end,
      {silent = false})
   end
})

-- -----------------------------------------------------------------------------
-- Rerun Macro
vim.keymap.set('n', 'Q', '@@', {noremap = true, silent = true})

-- -----------------------------------------------------------------------------
-- Terminal
vim.keymap.set('n', "<leader>ot", ":split<bar>term<CR><C-w>J:resize10<CR>", {silent = false})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {silent = true})

-- -----------------------------------------------------------------------------
-- WORKSPACE MANAGEMENT

-- Create window panes

vim.keymap.set("n", "<leader>sv", ":vsplit<Enter>")
vim.keymap.set("n", "<leader>sh", ":split<Enter>")

-- Change size of window panes

vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Down>", "<C-w>-")
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")

-- Changing window pane
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Create/Close/Duplicate Tabs

vim.keymap.set("n", "<leader>tn", ":tabe<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")
vim.keymap.set("n", "<leader>tm", ":tabmove<SPACE>")
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>")
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>td", ':let @" = expand("%")<CR>:tabe<CR>:e <C-r>"<CR>')

-- =============================================================================
-- Visual Keybindings
-- =============================================================================

-- Map auto complete of (, ", ', [
vim.keymap.set('v', "<leader>)", "<esc>`>a)<esc>`<i(<esc>", {silent = true})
vim.keymap.set('v', "<leader>(", "<esc>`>a)<esc>`<i(<esc>", {silent = true})
vim.keymap.set('v', "<leader>[", "<esc>`>a]<esc>`<i[<esc>", {silent = true})
vim.keymap.set('v', "<leader>]", "<esc>`>a]<esc>`<i[<esc>", {silent = true})
vim.keymap.set('v', "<leader>{", "<esc>`>a}<esc>`<i{<esc>", {silent = true})
vim.keymap.set('v', "<leader>}", "<esc>`>a}<esc>`<i{<esc>", {silent = true})
vim.keymap.set('v', '<leader>"', '<esc>`>a"<esc>`<i"<esc>', {silent = true})
vim.keymap.set('v', "<leader>'", "<esc>`>a'<esc>`<i'<esc>", {silent = true})
vim.keymap.set('v', "<leader>`", "<esc>`>a`<esc>`<i`<esc>", {silent = true})

-- Visual shifting (does not exit Visual mode)
vim.keymap.set('v', '<', '<gv', {silent = true})
vim.keymap.set('v', '>', '>gv', {silent = true})

-- =============================================================================
-- Command Line Mode Keybindings
--
-- TEST ON Arch PC
-- =============================================================================
vim.keymap.set('c', '<C-a>', 'Nop')

vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true, silent = true }) -- Forward character
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true, silent = true })  -- Backward character
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true, silent = true })  -- Beginning of line
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true, silent = true })

-- =============================================================================
-- Insert Keybindings
-- =============================================================================
vim.api.nvim_create_autocmd('LspAttach', {
   group = lsp_group,
   callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

      -- Telescope buffer jump
      -- vim.keymap.set('n', '<leader>fi', function(pos) require('telescope.builtin').lsp_document_symbols() end, {})
      vim.keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_document_symbols, {})
      vim.keymap.set('n', '<leader>fI', require('telescope.builtin').lsp_workspace_symbols, {})

      -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
      if client:supports_method('textDocument/completion') then
         vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})

         -- Add `<Tab>` completion
         vim.keymap.set("i", "<Tab>", function()
            local line = vim.fn.getline(".")
            local col = vim.fn.col(".") - 1  -- Column is 1-indexed, so subtract 1

            -- Check if cursor is at the start of the line or after a space
            if col == 0 or line:sub(col, col) == " " then
               return "<Tab>"  -- Insert a literal tab
            else
               -- Otherwise, trigger completion (e.g., nvim-cmp)
               -- return "<C-x><C-o>"  -- Trigger completion from insert mode
               return vim.lsp.completion.get()
            end
         end, { expr = true, noremap = true })
      end
   end,
})
