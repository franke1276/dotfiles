return {
  {
    "neovim/nvim-lspconfig",
    ft = { "elixir", "eelixir", "heex" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local ok, cmp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp.default_capabilities(capabilities)
      end

      vim.lsp.config.elixirls = {
        cmd = { "elixir-ls" },
        filetypes = { "elixir", "eelixir", "heex" },
        root_markers = { "mix.exs", ".git" },
        capabilities = capabilities,
        settings = {
          elixirLS = {
            dialyzerEnabled = true,
            fetchDeps = false,
          },
        },
      }

      -- Server aktivieren
      vim.lsp.enable("elixirls")
    end,
  },
}
