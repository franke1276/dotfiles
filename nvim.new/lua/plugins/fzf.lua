return {
  -- fzf binary (Plugin bringt den Code + installiert fzf bei Bedarf)
  {
    "junegunn/fzf",
    build = function()
      -- Installiert/updated fzf binary (plattformabhängig)
      vim.fn.system({ "bash", "-lc", "cd " .. vim.fn.stdpath("data") .. "/lazy/fzf && ./install --bin" })
    end,
  },

  -- Vim/Neovim Integration: :Files, :Rg, :Buffers, ...
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    cmd = { "Files", "Rg", "Buffers", "GFiles", "Helptags", "Commands" },
    keys = {
      { "<leader>f", "<cmd>Files<cr>", desc = "FZF Files" },
      { "<leader>s", "<cmd>Rg<cr>", desc = "FZF Ripgrep" },
      { "<leader>b", "<cmd>Buffers<cr>", desc = "FZF Buffers" },
    },
    config = function()
      -- Optional: Preview-Fenster (funktioniert gut, braucht meist keine Extras)
      vim.g.fzf_preview_window = { "right:50%", "ctrl-/" }
      -- Optional: Layout
      vim.g.fzf_layout = { down = "40%" }
    end,
  },
}

