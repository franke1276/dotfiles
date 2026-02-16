local function lsp_keymaps(bufnr)
  local map = vim.keymap.set
  local opts = { buffer = bufnr, silent = true }

  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gD", vim.lsp.buf.implementation, opts)
--  map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
 -- map("n", "1gD", vim.lsp.buf.type_definition, opts)
  -- map("n", "gr", vim.lsp.buf.references, opts)
  -- map("n", "g0", vim.lsp.buf.document_symbol, opts)
  -- map("n", "gW", vim.lsp.buf.workspace_symbol, opts)
  --map("n", "gd", vim.lsp.buf.definition, opts)

  local builtin = require('telescope.builtin')
  map('n', 'gr', builtin.lsp_references, opts)
  map('n', 'gd', builtin.lsp_definitions, opts)

  map("n", "ga", vim.lsp.buf.code_action, opts)
  map("n", "gx", vim.diagnostic.open_float, opts)
  map("n", "gn", vim.lsp.buf.rename, opts)
  map("n", "en", vim.diagnostic.goto_next, opts)

  map("n", "gt", "<cmd>RustLsp testables<cr>", { buffer = true })

  -- map("n", "<leader>gr", "<cmd>RustLsp run<cr>", opts)
  -- map("n", "<leader>gd", "<cmd>RustLsp debuggables<cr>", opts)
end

return lsp_keymaps
