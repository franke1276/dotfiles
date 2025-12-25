local M = {}

function M.on_attach(client, bufnr)
  -- Nur wenn der LSP formatieren kann
  if client.server_capabilities.documentFormattingProvider then
    local group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, { clear = true })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          async = false,
        })
      end,
    })
  end
end

return M

