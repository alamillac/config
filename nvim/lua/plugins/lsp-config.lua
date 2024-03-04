return {
  {
    'williamboman/mason.nvim',
    config = true
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "eslint",
        "rust_analyzer",
        "pyright",
        "gopls",
        "bashls",
      }
    },
    config = true
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", function()
        vim.cmd.vsplit()
        vim.lsp.buf.definition()
      end, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
