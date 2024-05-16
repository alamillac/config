return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      keymaps = {
        ["<C-h>"] = false
      },
      view_options = {
        show_hidden = true
      }
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<leader>fv", oil.toggle_float, { desc = "Open parent directory" }) -- When in "normal mode" (n)
  end
}
