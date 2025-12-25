return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- vor anderen Plugins laden
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
