return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "BurntSushi/ripgrep",
      "sharkdp/fd",
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },

    -- cmd = "Telescope",
    keys = {
      { "<leader>a", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>s", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>g", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Grep string" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      telescope.setup({
        pickers = {
          find_files = {
            theme = "dropdown"
          },
          live_grep = {
            theme = "dropdown"
          },
          grep_string = {
            theme = "dropdown"
          },
          buffers = {
            theme = "dropdown"
          }
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
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
