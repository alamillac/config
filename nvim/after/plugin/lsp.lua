local lsp_zero = require("lsp-zero")

--lsp.preset({})
lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	-- lsp_zero.default_keymaps({ buffer = bufnr })
	-- lsp_zero.buffer_autoformat()

	-- lspconfig keymap
	-- Run  :h vim.lsp.buf  to find more uses of lsp
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())

lsp_zero.setup()
