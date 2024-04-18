-- Abreviaturas
vim.cmd([[iabbrev <silent> #e /************************************************************************/]])

-- Autocmd
-- Remember last cursor position
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  group = lastplace,
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

-- To remove trailing white space on save
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = {"*"},
--     callback = function()
--       local save_cursor = vim.fn.getpos(".")
--       pcall(function() vim.cmd [[%s/\s\+$//e]] end)
--       vim.fn.setpos(".", save_cursor)
--     end,
-- })

-- function open_quickfix_in_tabs()
--     local qflist = vim.fn.getqflist()
--     print(qflist)
--     for _, qf in ipairs(qflist) do
--         vim.cmd('tabedit ' .. qf.filename)
--     end
-- end
-- 
-- vim.cmd('command! OpenQFixFiles lua open_quickfix_in_tabs()')
