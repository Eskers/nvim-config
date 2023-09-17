-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Clear Highlights after search
local hl_ns = vim.api.nvim_create_namespace('search')
local hlsearch_group = vim.api.nvim_create_augroup('hlsearch_group', { clear = true })

local function manage_hlsearch(char)
  local key = vim.fn.keytrans(char)
  local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }

  if vim.fn.mode() == 'n' then
    if not vim.tbl_contains(keys, key) then
       vim.cmd([[ :set nohlsearch ]])
    elseif vim.tbl_contains(keys, key) then
       vim.cmd([[ :set hlsearch ]])
    end
  end

  vim.on_key(nil, hl_ns)
end

vim.api.nvim_create_autocmd('CursorMoved', {
  group = hlsearch_group,
  callback = function()
    vim.on_key(manage_hlsearch, hl_ns)
  end,
})

-- Remember last cursor position opening buffer
local position_group = vim.api.nvim_create_augroup("PositionCursor", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
  group = position_group
})

-- Remove trailing whitespace on save
local whitespace_group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true })
-- end of line
vim.api.nvim_create_autocmd("BufWritePre", { command = [[:%s/\s\+$//e]], group = whitespace_group, })
--end of file
vim.api.nvim_create_autocmd("BufWritePre", { command = [[:%s#\($\n\s*\)\+\%$##e]], group = whitespace_group, })

-- [[ Required as NVim doesn't seem to respect format options via opt ]]
local comment_group = vim.api.nvim_create_augroup("FormatOptions", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  command = [[set formatoptions-=o]],
  group = comment_group,
})
vim.api.nvim_create_autocmd("FileType", {
  command = [[set formatoptions-=l]],
  group = comment_group,
})
vim.api.nvim_create_autocmd("FileType", {
  command = [[set formatoptions+=n]],
  group = comment_group,
})

-- Only show cursor line on active buffer
local cursor_group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = cursor_group,
        pattern = pattern,
        callback = function()
            vim.opt_local.cursorline = value
      end,
    })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")
