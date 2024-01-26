--require("onedarkpro").setup({
--  options = {
--    transparency = true
--  },
--  highlights = {
--    Comment = { underline = true, extend = true },
--    MatchParen = { extend = true, fg = "#528BFF", bg = "#515A6B" }
--  }
--})
--
--function ColorMyPencils(color)
--    -- color = color or "rose-pine"
--    -- color = color or "catppuccin_mocha"
--    color = color or "onedark_vivid"
--    vim.cmd.colorscheme(color)
--
--    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--end

require("catppuccin").setup({
  flavour = "mocha"
})

function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


ColorMyPencils()
