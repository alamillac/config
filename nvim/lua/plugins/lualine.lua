return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "dracula",
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1, -- to show relative path
        },
      },
    },
  },
  config = true,
}
