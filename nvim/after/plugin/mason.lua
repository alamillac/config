local mason = require("mason")
local masonLsp = require("mason-lspconfig")
local masonNullLs = require("mason-null-ls")

mason.setup()
masonLsp.setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"eslint",
		"rust_analyzer",
		"pyright",
		"gopls",
		"bashls",
	},
})
masonNullLs.setup({
	ensure_installed = nil,
	automatic_installation = true,
})
