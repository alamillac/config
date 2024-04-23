return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fh", function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end, {})
      vim.keymap.set("n", "<C-f>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>fg", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set("n", "<leader>fw", function() -- Search for occurrences of the specific word
        builtin.grep_string({
          use_regex = false,
          additional_args = {
            "--case-sensitive", -- rg options
            "--fixed-strings", -- rg options (Treat the pattern as a literal string instead of a regular expression)
            "--word-regexp", -- rg options (Only show matches surrounded by word boundaries)
            "--hidden", -- rg options (include hidden files)
            -- "--no-ignore" -- rg options (include files listed in .gitignore)
          },
        })
      end, {})
      vim.keymap.set("n", "<leader>fW", builtin.grep_string, {})
      vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      telescope.load_extension("ui-select")
    end,
  },
}
