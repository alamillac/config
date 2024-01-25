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
