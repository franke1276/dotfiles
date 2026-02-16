return {
  {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
    "nvim-mini/mini.pick",           -- optional
    "folke/snacks.nvim",             -- optional
  },
  cmd = "Neogit",

  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
  }
},
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        current_line_blame = false, -- per Toggle
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local map = vim.keymap.set
          local opts = { buffer = bufnr, silent = true }

          -- Hunks
          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(gs.next_hunk)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr, silent = true })

          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(gs.prev_hunk)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr, silent = true })

          map("n", "<leader>hs", gs.stage_hunk, opts)
          map("n", "<leader>hr", gs.reset_hunk, opts)
          map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, opts)
          map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, opts)

          map("n", "<leader>hp", gs.preview_hunk, opts)
          map("n", "<leader>hb", gs.blame_line, opts)
          map("n", "<leader>hd", gs.diffthis, opts)
          map("n", "<leader>hD", function() gs.diffthis("~") end, opts)

          map("n", "<leader>tb", gs.toggle_current_line_blame, opts)
          map("n", "<leader>td", gs.toggle_deleted, opts)
        end,
      })
    end,
  },

}
