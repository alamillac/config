local mason = require("mason")
local masonLsp = require("mason-lspconfig")

mason.setup()
masonLsp.setup({
    ensure_installed = {
        'lua_ls',
        'tsserver',
        'eslint',
        'rust_analyzer',
    },
})
