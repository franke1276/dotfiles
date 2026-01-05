vim.diagnostic.config({
  virtual_text = {
    prefix = "●",   -- kleines Symbol im Code
    spacing = 4,
  },
  signs = true,     -- Zeichen links im Gutter
  underline = true,
  update_in_insert = false, -- nicht beim Tippen flackern
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

