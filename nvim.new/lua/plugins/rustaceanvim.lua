return {
  {
    "mrcjkb/rustaceanvim",
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      vim.g.rustaceanvim = {
        server = {
          capabilities = capabilities,

          on_attach = function(client, bufnr)
            require("config.lsp_keymaps")(bufnr)
	    require("config.format").on_attach(client, bufnr)
          end,
          cmd = { "rust-analyzer" },
          settings = {
            ["rust-analyzer"] = {
	            inlayHints = {
                bindingModeHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always", useParameterNames = true },
                parameterHints = { enable = true },
                typeHints = { enable = true },
                chainingHints = { enable = true },
              },
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
              },
              checkOnSave = true,
              diagnostics = {
                enable = true,
              },
              completion = {
                autoimport = { enable = true },       -- use foo::bar automatisch
                callable = { snippets = "fill_arguments" }, -- fn(x, y) wird als snippet eingefügt
                postfix = { enable = true },          -- .if/.match/.dbg etc (wenn verfügbar)
              },
            },
          },
        },
      }
      vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    local opts = { buffer = true }
    vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<cr>", opts)
    vim.keymap.set("n", "<leader>ca", "<cmd>RustLsp codeAction<cr>", opts)
    vim.keymap.set("n", "<leader>rr", "<cmd>RustLsp run<cr>", opts)
    vim.keymap.set("n", "<leader>rd", "<cmd>RustLsp debuggables<cr>", opts)
  end,
})
    end,
  },
}

