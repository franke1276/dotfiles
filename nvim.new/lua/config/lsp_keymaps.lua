local function lsp_keymaps(bufnr)
  local map = vim.keymap.set
  local opts = { buffer = bufnr, silent = true }

  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gD", vim.lsp.buf.implementation, opts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  map("n", "1gD", vim.lsp.buf.type_definition, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "g0", vim.lsp.buf.document_symbol, opts)
  map("n", "gW", vim.lsp.buf.workspace_symbol, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)

  -- Neovim 0.11: formatting_sync ist deprecated
  map("n", "gf", function()
    vim.lsp.buf.format({ async = false })
  end, opts)

  
  map("n", "ga", vim.lsp.buf.code_action, opts)
  map("n", "gx", vim.diagnostic.open_float, opts)
  map("n", "gn", vim.lsp.buf.rename, opts)
  map("n", "en", vim.diagnostic.goto_next, opts)

  map("n", "<leader>rt", "<cmd>RustLsp testables<cr>", { buffer = true })
  map("n", "gt", function()
      vim.cmd("RustLsp testables")
  end, opts)
  map("n", "<leader>q", function()
    vim.diagnostic.setqflist()
  end, { silent = true })

  -- map("n", "<leader>gr", "<cmd>RustLsp run<cr>", opts)
  -- map("n", "<leader>gd", "<cmd>RustLsp debuggables<cr>", opts)
end

return lsp_keymaps
