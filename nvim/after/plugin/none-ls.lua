local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Lua
		null_ls.builtins.formatting.stylua,

		-- javascript
		null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.diagnostics.eslint_d,

		-- python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.pylint.with({
			extra_args = { "--disable", "c0114,c0115,c0116,c0301,w1203,w0703" },
		}),

    -- bash
		null_ls.builtins.formatting.shfmt,
	},
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
