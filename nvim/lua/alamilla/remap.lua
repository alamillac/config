-- Example remap from vim
-- nnoremap <F5> :UndotreeToggle<CR>
-- vim.keymap.set("n", "<F5>", vim.cmd.UndotreeToggle)
-- "n" is for "normal mode", "i" for "insert mode" and "v" for "visual mode"

-- Remaps:

-- Unmap the arrow keys
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { noremap = true, silent = true })

-- Remap esc key
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })

-- With the following mapping a user can press F5 to delete all trailing whitespace
vim.api.nvim_set_keymap('n', '<F5>', [[:%s/\s\+$//e<CR>:nohlsearch<CR>]], { noremap = true, silent = true })

-- easier moving between tabs
vim.api.nvim_set_keymap('n', '<Leader>n', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>m', ':tabnext<CR>', { noremap = true, silent = true })

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<M-Left>', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Right>', ':bnext<CR>', { noremap = true, silent = true })

-- Usar <líder> + y para copiar al portapapeles
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })

-- Usar <líder> + d para cortar al portapapeles
vim.api.nvim_set_keymap('v', '<leader>d', '"+d', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>d', '"+d', { noremap = true })

-- Usar <líder> + p para pegar desde el portapapeles
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>P', '"+P', { noremap = true })

-- Execute shell commands in buffer
vim.api.nvim_set_keymap('n', 'Q', '!!bash<CR>', { noremap = true })

-- Python IDE Setup
vim.api.nvim_set_keymap('n', '<Leader>b', 'Oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>', { noremap = true })

-- Bind Ctrl+<movement> keys to move around the windows
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })

-- Replace a word with another saved in the 0 register
vim.api.nvim_set_keymap('n', '<Leader>rw', 'viw"0p', { noremap = true })

-- Copy all line
vim.api.nvim_set_keymap('n', 'Y', 'yy', { noremap = true })

-- Easier moving of code blocks
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true })  -- better indentation
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true })  -- better indentation

-- Make tab in visual mode work like keeping highlighting
vim.api.nvim_set_keymap('x', '<Tab>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('x', '<S-Tab>', '<gv', { noremap = true })

-- Open a new tab and search for something
-- vim.api.nvim_set_keymap('n', '<Leader>a', ':tab split<CR>:Ack ""<left>', { noremap = true })

-- Search the word under the cursor
-- vim.api.nvim_set_keymap('n', '<Leader>A', ':tab split<CR>:Ack <C-r><C-w><CR>', { noremap = true })

-- CtrlP Fuzzy file finder
-- vim.api.nvim_set_keymap('n', '<Leader>f', ':CtrlP<CR>', { noremap = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)  -- When in "normal mode" (n)


-- Abreviaturas
vim.cmd([[iabbrev <silent> #e /************************************************************************/]])
