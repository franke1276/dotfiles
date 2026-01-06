return {
  {
     "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

    -- cmd = "Telescope",
    keys = {
      { "<leader>a", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      telescope.setup({
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
              i = {
                -- Bewegung
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                -- Navigation
                ["<C-l>"] = actions.select_default,   -- öffnen
                ["<C-h>"] = fb_actions.goto_parent_dir,

                -- Optional
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
              },
              n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-l>"] = actions.select_default,
                ["<C-h>"] = fb_actions.goto_parent_dir,
              },
            },
          },
        },
      })

      -- extensions explizit laden
      telescope.load_extension("file_browser")
    end,
  },
}
