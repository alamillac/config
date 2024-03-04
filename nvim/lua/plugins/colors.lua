function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return { "catppuccin/nvim", name = "catppuccin", priority = 1000,
  opts = {
    flavour = "mocha"
  },
  config = function()
    ColorMyPencils()
  end
}
