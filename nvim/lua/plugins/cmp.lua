return {
  {
    'github/copilot.vim',
    config = function()
      local file = io.open('/tmp/copilot_disabled', 'r')
      if file~=nil then
        file:close()
        print("Copilot disabled")
        vim.cmd("Copilot disable")
      end
    end
  },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      -- this is the function that loads the extra snippets to luasnip
      -- from rafamadriz/friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      local cmp = require("cmp")

      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip", keyword_length = 2 },
        }, {
          { name = "buffer", keyword_length = 3 },
        }),
      })
    end,
  },
}
