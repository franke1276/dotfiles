return {
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
   {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Gclog", "Gblame" },
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Git status (fugitive)" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
      { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
      { "<leader>gb", "<cmd>Gblame<cr>", desc = "Git blame (fugitive)" },
    },
  },
}


